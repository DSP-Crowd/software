-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--                                                                         --
--  This file is part of the DSP-Crowd project                             --
--  https://www.dsp-crowd.com                                              --
--                                                                         --
--  Author(s):                                                             --
--      - Johannes Natter, office@dsp-crowd.com                            --
--                                                                         --
-----------------------------------------------------------------------------
--                                                                         --
--  Copyright (C) 2017 Authors and www.dsp-crowd.com                       --
--                                                                         --
--  This program is free software: you can redistribute it and/or modify   --
--  it under the terms of the GNU General Public License as published by   --
--  the Free Software Foundation, either version 3 of the License, or      --
--  (at your option) any later version.                                    --
--                                                                         --
--  This program is distributed in the hope that it will be useful,        --
--  but WITHOUT ANY WARRANTY; without even the implied warranty of         --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the           --
--  GNU General Public License for more details.                           --
--                                                                         --
--  You should have received a copy of the GNU General Public License      --
--  along with this program. If not, see <http://www.gnu.org/licenses/>.   --
--                                                                         --
-----------------------------------------------------------------------------
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tbd_rr_base is
	generic
	(
		use_sdram_pll	: std_ulogic := '1';
		num_gpios	: natural := 64
	);
	port
	(
		clock_50mhz	: in    std_ulogic;

		keys		: in    std_ulogic_vector(1 downto 0);
		switches	: in    std_ulogic_vector(3 downto 0);
		leds		: out   std_ulogic_vector(7 downto 0);

		spi_cs		: in    std_ulogic_vector(1 downto 0);
		spi_clk		: in    std_ulogic;
		spi_mosi	: in    std_ulogic;
		spi_miso	: out   std_ulogic;

		spi_epcs_cs	: out   std_ulogic;
		spi_epcs_clk	: out   std_ulogic;
		spi_epcs_mosi	: out   std_ulogic;
		spi_epcs_miso	: in    std_ulogic;

		arReconf	: in    std_ulogic;

		gpios		: inout std_logic_vector(0 to num_gpios - 1)
	);
end tbd_rr_base;

architecture rtl of tbd_rr_base is

	signal reset_done			: std_ulogic := '0';
	signal n_reset_async			: std_logic;
	signal inputs_unsynced			: std_ulogic_vector(switches'length downto 0);
	signal inputs_synced			: std_ulogic_vector(inputs_unsynced'range);
	signal inputs_synced_debounced		: std_ulogic_vector(inputs_synced'range);
	signal key_0_synced_debounced		: std_ulogic;
	signal switches_synced_debounced	: std_ulogic_vector(switches'range);

	signal spi_unsynced			: std_ulogic_vector(2 downto 0);
	signal spi_synced			: std_ulogic_vector(2 downto 0);
	signal spi_cs_user_synced		: std_ulogic;
	signal spi_clk_synced			: std_ulogic;
	signal spi_mosi_synced			: std_ulogic;

	signal spi_slave_miso			: std_ulogic;

	signal spi_slave_data			: std_ulogic_vector(7 downto 0);
	signal spi_slave_data_is_id		: std_ulogic;
	signal spi_slave_data_valid		: std_ulogic;

	signal spi_slave_input_state		: std_ulogic_vector(0 to num_gpios - 1);
	signal spi_slave_input_state_valid	: std_ulogic_vector(0 to num_gpios - 1);
	signal spi_slave_cmd_done		: std_ulogic_vector(0 to num_gpios - 1);

	signal spi_slave_input_state_res	: std_ulogic_vector(0 to num_gpios - 1);
	signal spi_slave_input_state_valid_res	: std_ulogic_vector(0 to num_gpios - 1);
	signal spi_slave_cmd_done_res		: std_ulogic_vector(0 to num_gpios - 1);

begin

	-- Reconfiguration unit
	reconfUnit: entity work.altremotePulsed(rtl)
	port map
	(
		clock		=> clock_50mhz,
		nResetAsync	=> n_reset_async,
		reconf		=> arReconf
	);

	-- Give epcs64 signals to external user
	-- No need to synchronize. Signals are not used within system clock
	spi_epcs_cs <= spi_cs(0);
	spi_epcs_clk <= spi_clk;
	spi_epcs_mosi <= spi_mosi;
	-- Important: MISO must not drive signal if epcs64 is not selected
	spi_miso <= spi_epcs_miso when spi_cs(0) = '0' else
			spi_slave_miso when spi_cs_user_synced = '0' else 'Z';

	-- Synchronize inputs
	inputs_unsynced <=  switches & keys(0);
	key_sync: entity work.input_sync(rtl)
	generic map
	(
		num_inputs      => inputs_unsynced'length,
		num_sync_stages => 2
	)
	port map
	(
		clock           => clock_50mhz,
		n_reset_async   => n_reset_async,
		unsynced_inputs => inputs_unsynced,
		synced_outputs  => inputs_synced
	);

	-- Debounce inputs
	key_debounce: entity work.input_debounce(rtl)
	generic map
	(
		num_inputs        => inputs_synced'length
	)
	port map
	(
		clock             => clock_50mhz,
		n_reset_async     => n_reset_async,
		synced_inputs     => inputs_synced,
		debounced_outputs => inputs_synced_debounced
	);
	key_0_synced_debounced <= inputs_synced_debounced(0);
	switches_synced_debounced <= inputs_synced_debounced(inputs_synced_debounced'high downto 1);

	-- Synchronize SPI
	spi_unsynced <=  spi_cs(1) & spi_clk & spi_mosi;
	spi_sync: entity work.input_sync(rtl)
	generic map
	(
		num_inputs      => spi_unsynced'length,
		num_sync_stages => 2
	)
	port map
	(
		clock           => clock_50mhz,
		n_reset_async   => n_reset_async,
		unsynced_inputs => spi_unsynced,
		synced_outputs  => spi_synced
	);
	spi_cs_user_synced <= spi_synced(2);
	spi_clk_synced <= spi_synced(1);
	spi_mosi_synced <= spi_synced(0);

	-- Hardware-is-alive-LED
	hardware_is_alive_led: entity work.frequencyDivider(rtl)
	generic map
	(
		divideBy	=> 25E7
	)
	port map
	(
		clock		=> clock_50mhz,
		nResetAsync	=> n_reset_async,
		output		=> leds(0)
	);

	-- SPI-Slave
	spislave: entity work.spi_slave(rtl)
	port map
	(
		clock			=> clock_50mhz,
		n_reset_async		=> n_reset_async,

		spi_cs			=> spi_cs_user_synced,
		spi_clk			=> spi_clk_synced,
		spi_mosi		=> spi_mosi_synced,
		spi_miso		=> spi_slave_miso,

		data			=> spi_slave_data,
		data_is_id		=> spi_slave_data_is_id,
		data_valid		=> spi_slave_data_valid,

		input_state		=> spi_slave_input_state_res(0),
		input_state_valid	=> spi_slave_input_state_valid_res(0),
		cmd_done		=> spi_slave_cmd_done_res(0)

	);

	-- GPIOs
	gpio_ext_all: for i in 0 to num_gpios - 1 generate
		gpio_ext_n: entity work.gpio_ext(rtl)
		generic map
		(
			my_id			=> i
		)
		port map
		(
			clock			=> clock_50mhz,
			n_reset_async		=> n_reset_async,

			spi_cs			=> spi_cs_user_synced,

			data			=> spi_slave_data,
			data_is_id		=> spi_slave_data_is_id,
			data_valid		=> spi_slave_data_valid,

			input_state		=> spi_slave_input_state(i),
			input_state_valid	=> spi_slave_input_state_valid(i),
			cmd_done		=> spi_slave_cmd_done(i),

			gpio			=> gpios(i)
		);
	end generate;

	or_blocks: for i in 0 to num_gpios - 2 generate
		spi_slave_input_state_res	(i) <= spi_slave_input_state_res	(i + 1) or spi_slave_input_state		(i);
		spi_slave_input_state_valid_res	(i) <= spi_slave_input_state_valid_res	(i + 1) or spi_slave_input_state_valid		(i);
		spi_slave_cmd_done_res		(i) <= spi_slave_cmd_done_res		(i + 1) or spi_slave_cmd_done			(i);
    	end generate;
	spi_slave_input_state_res(num_gpios - 1) <= '0';
	spi_slave_input_state_valid_res(num_gpios - 1) <= '0';
	spi_slave_cmd_done_res(num_gpios - 1) <= '0';

	-- Reset
	proc_reset: process(clock_50mhz)
	begin
		if clock_50mhz'event and clock_50mhz = '1' then
			reset_done <= '1';
		end if;
	end process;
	n_reset_async <= reset_done and keys(1);

end architecture rtl;
