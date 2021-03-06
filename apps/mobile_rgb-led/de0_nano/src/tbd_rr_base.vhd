-----------------------------------------------------------------------------
-----------------------------------------------------------------------------
--                                                                         --
--  This file is part of the DE0_Nano_Linux project                        --
--  http://www.de0nanolinux.com                                            --
--                                                                         --
--  Author(s):                                                             --
--      - Helmut, redrocket@gmx.at                                         --
--                                                                         --
-----------------------------------------------------------------------------
--                                                                         --
--  Copyright (C) 2015 Authors and www.de0nanolinux.com                    --
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

use work.spi2rgb_pkg.all;

entity tbd_rr_base is
	generic
	(
		use_sdram_pll	: std_ulogic := '1'
	);
	port
	(
		clock_50mhz	: in    std_ulogic;

		keys		: in    std_ulogic_vector(1 downto 0);
		switches	: in    std_ulogic_vector(3 downto 0);
		leds		: out   std_ulogic_vector(7 downto 0);

		uart_rx		: in    std_ulogic;
		uart_tx		: out   std_ulogic;

		spi_cs		: in    std_ulogic_vector(1 downto 0);
		spi_clk		: in    std_ulogic;
		spi_mosi	: in    std_ulogic;
		spi_miso	: out   std_ulogic;

		spi_epcs_cs	: out   std_ulogic;
		spi_epcs_clk	: out   std_ulogic;
		spi_epcs_mosi	: out   std_ulogic;
		spi_epcs_miso	: in    std_ulogic;

		arReconf	: in  std_ulogic;

		pwm_red		: out   std_ulogic;
		pwm_green	: out   std_ulogic;
		pwm_blue	: out   std_ulogic;

		sdram_addr	: out   std_logic_vector(12 downto 0);
		sdram_ba	: out   std_logic_vector(1 downto 0);
		sdram_cke	: out   std_logic;
		sdram_clk	: out   std_logic;
		sdram_cs_n	: out   std_logic;
		--sdram_dq          : inout std_logic_vector(15 downto 0);
		sdram_dq	: in    std_logic_vector(15 downto 0);
		sdram_dqm	: out   std_logic_vector(1 downto 0);
		sdram_cas_n	: out   std_logic;
		sdram_ras_n	: out   std_logic;
		sdram_we_n	: out   std_logic
	);
end tbd_rr_base;

architecture rtl of tbd_rr_base is

	signal reset_done         : std_ulogic := '0';
	signal n_reset_async      : std_logic;
	signal inputs_unsynced    : std_ulogic_vector(switches'length downto 0);
	signal inputs_synced      : std_ulogic_vector(inputs_unsynced'range);
	signal inputs_synced_debounced : std_ulogic_vector(inputs_synced'range);
	signal key_0_synced_debounced : std_ulogic;
	signal switches_synced_debounced : std_ulogic_vector(switches'range);

	signal spi_unsynced       : std_ulogic_vector(2 downto 0);
	signal spi_synced         : std_ulogic_vector(2 downto 0);
	signal spi_cs_user_synced : std_ulogic;
	signal spi_clk_synced     : std_ulogic;
	signal spi_mosi_synced    : std_ulogic;

	signal spi2rgb_data       : SPI2RGB_DATA_TYPE;
	signal spi2rgb_valid_bits : std_ulogic_vector(SPI2RGB_NUM_DATA_BYTES - 1 downto 0);

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
	spi_miso <= spi_epcs_miso when spi_cs(0) = '0' else 'Z';

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
	spislave: entity work.spi2rgb(rtl)
	port map
	(
		clock		=> clock_50mhz,
		n_reset_async	=> n_reset_async,

		spi_cs		=> spi_cs_user_synced,
		spi_clk		=> spi_clk_synced,
		spi_mosi	=> spi_mosi_synced,

		data		=> spi2rgb_data,
		valid_bits	=> spi2rgb_valid_bits
	);

	-- RGB PWMs
	pwmred: entity work.byte2pwm(rtl)
	port map
	(
		clock		=> clock_50mhz,
		n_reset_async	=> n_reset_async,

		data		=> spi2rgb_data(2),
		data_valid	=> spi2rgb_valid_bits(2),

		led_pwm		=> pwm_red
	);
	pwmgreen: entity work.byte2pwm(rtl)
	port map
	(
		clock		=> clock_50mhz,
		n_reset_async	=> n_reset_async,

		data		=> spi2rgb_data(1),
		data_valid	=> spi2rgb_valid_bits(1),

		led_pwm		=> pwm_green
	);
	pwmblue: entity work.byte2pwm(rtl)
	port map
	(
		clock		=> clock_50mhz,
		n_reset_async	=> n_reset_async,

		data		=> spi2rgb_data(0),
		data_valid	=> spi2rgb_valid_bits(0),

		led_pwm		=> pwm_blue
	);

	-- Reset
	proc_reset: process(clock_50mhz)
	begin
		if clock_50mhz'event and clock_50mhz = '1' then
			reset_done <= '1';
		end if;
	end process;
	n_reset_async <= reset_done and keys(1);

end architecture rtl;
