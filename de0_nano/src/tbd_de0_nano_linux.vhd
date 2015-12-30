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

use work.top_level_components.all;

entity tbd_de0_nano_linux is
	generic
	(
		use_sdram_pll : std_ulogic := '1'
	);
	port
	(
		clock_50mhz       : in    std_ulogic;
		keys              : in    std_ulogic_vector(1 downto 0);
		switches          : in    std_ulogic_vector(3 downto 0);
		leds              : out   std_ulogic_vector(7 downto 0);
		uart_rx           : in    std_ulogic;
		uart_tx           : out   std_ulogic;
		spi_cs            : out   std_ulogic_vector(3 downto 0);
		spi_miso          : in    std_ulogic;
		spi_mosi          : out   std_ulogic;
		spi_clk           : out   std_ulogic;
		spi_epcs_miso     : in    std_ulogic;
		spi_epcs_mosi     : out   std_ulogic;
		spi_epcs_clk      : out   std_ulogic;
		enc_clk           : out   std_ulogic;
		sdram_addr        : out   std_logic_vector(12 downto 0);
		sdram_ba          : out   std_logic_vector(1 downto 0);
		sdram_cke         : out   std_logic;
		sdram_clk         : out   std_logic;
		sdram_cs_n        : out   std_logic;
		sdram_dq          : inout std_logic_vector(15 downto 0);
		sdram_dqm         : out   std_logic_vector(1 downto 0);
		sdram_cas_n       : out   std_logic;
		sdram_ras_n       : out   std_logic;
		sdram_we_n        : out   std_logic
	);
end tbd_de0_nano_linux;

architecture rtl of tbd_de0_nano_linux is

	constant dw               : integer := 32;
	constant aw               : integer := 32;
	signal reset_done         : std_ulogic := '0';
	signal n_reset_async      : std_logic;
	signal inputs_unsynced    : std_ulogic_vector(switches'length downto 0);
	signal inputs_synced      : std_ulogic_vector(inputs_unsynced'range);
	signal inputs_synced_debounced : std_ulogic_vector(inputs_synced'range);
	signal key_0_synced_debounced : std_ulogic;
	signal switches_synced_debounced : std_ulogic_vector(switches'range);
	signal clmode             : std_logic;
	signal pic_ints           : std_logic_vector(20 - 1 downto 0);
	signal iwb_clk            : std_logic;
	signal iwb_rst            : std_logic;
	signal iwb_ack            : std_logic;
	signal iwb_err            : std_logic;
	signal iwb_rty            : std_logic;
	signal iwb_dat_slave2cpu  : std_logic_vector(dw - 1 downto 0);
	signal iwb_cyc            : std_logic;
	signal iwb_adr            : std_logic_vector(aw - 1 downto 0);
	signal iwb_stb            : std_logic;
	signal iwb_we             : std_logic;
	signal iwb_sel            : std_logic_vector(3 downto 0);
	signal iwb_dat_cpu2slave  : std_logic_vector(dw - 1 downto 0);
	signal iwb_cti            : std_logic_vector(2 downto 0);
	signal iwb_bte            : std_logic_vector(1 downto 0);
	signal dwb_clk            : std_logic;
	signal dwb_rst            : std_logic;
	signal dwb_ack            : std_logic;
	signal dwb_err            : std_logic;
	signal dwb_rty            : std_logic;
	signal dwb_dat_slave2cpu  : std_logic_vector(dw - 1 downto 0);
	signal dwb_cyc            : std_logic;
	signal dwb_adr            : std_logic_vector(aw - 1 downto 0);
	signal dwb_stb            : std_logic;
	signal dwb_we             : std_logic;
	signal dwb_sel            : std_logic_vector(3 downto 0);
	signal dwb_dat_cpu2slave  : std_logic_vector(dw - 1 downto 0);
	signal dwb_cti            : std_logic_vector(2 downto 0);
	signal dwb_bte            : std_logic_vector(1 downto 0);
	signal dbg_stall          : std_logic;
	signal dbg_ewt            : std_logic;
	signal dbg_lss            : std_logic_vector(3 downto 0);
	signal dbg_is             : std_logic_vector(1 downto 0);
	signal dbg_wp             : std_logic_vector(10 downto 0);
	signal dbg_bp             : std_logic;
	signal dbg_stb            : std_logic;
	signal dbg_we             : std_logic;
	signal dbg_adr            : std_logic_vector(aw - 1 downto 0);
	signal dbg_dat_slave2cpu  : std_logic_vector(dw - 1 downto 0);
	signal dbg_dat_cpu2slave  : std_logic_vector(dw - 1 downto 0);
	signal dbg_ack            : std_logic;
	signal pm_cpustall        : std_logic;
	signal pm_clksd           : std_logic_vector(3 downto 0);
	signal pm_dc_gate         : std_logic;
	signal pm_ic_gate         : std_logic;
	signal pm_dmmu_gate       : std_logic;
	signal pm_immu_gate       : std_logic;
	signal pm_tt_gate         : std_logic;
	signal pm_cpu_gate        : std_logic;
	signal pm_wakeup          : std_logic;
	signal pm_lvolt           : std_logic;

begin

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

	-- Hardware-is-alive-LED
	hardware_is_alive_led: entity work.frequency_divider(rtl)
	generic map
	(
		divide_by     => 25E7
	)
	port map
	(
		clock         => clock_50mhz,
		n_reset_async => n_reset_async,
		strobe_output => leds(leds'high)
	);

	-- Reset
	proc_reset: process(clock_50mhz)
	begin
		if clock_50mhz'event and clock_50mhz = '1' then
			reset_done <= '1';
		end if;
	end process;
	n_reset_async <= reset_done and keys(1);

	-- or1200
	cpu0: entity work.or1200_top
	generic map
	(
		dw             => 32,
		aw             => 32,
		ppic_ints      => 20,
		boot_adr       => 256
	)
	port map
	(
		-- System
		clk_i          => clock_50mhz,
		rst_i          => n_reset_async,
		clmode_i       => clmode,
		pic_ints_i     => pic_ints,

		-- Instruction WISHBONE interface
		iwb_clk_i      => iwb_clk,
		iwb_rst_i      => iwb_rst,
		iwb_ack_i      => iwb_ack,
		iwb_err_i      => iwb_err,
		iwb_rty_i      => iwb_rty,
		iwb_dat_i      => iwb_dat_slave2cpu,
		iwb_cyc_o      => iwb_cyc,
		iwb_adr_o      => iwb_adr,
		iwb_stb_o      => iwb_stb,
		iwb_we_o       => iwb_we,
		iwb_sel_o      => iwb_sel,
		iwb_dat_o      => iwb_dat_cpu2slave,
		-- iwb_cab_o => open,
		iwb_cti_o      => iwb_cti,
		iwb_bte_o      => iwb_bte,

		-- Data WISHBONE interface
		dwb_clk_i      => dwb_clk,
		dwb_rst_i      => dwb_rst,
		dwb_ack_i      => dwb_ack,
		dwb_err_i      => dwb_err,
		dwb_rty_i      => dwb_rty,
		dwb_dat_i      => dwb_dat_slave2cpu,
		dwb_cyc_o      => dwb_cyc,
		dwb_adr_o      => dwb_adr,
		dwb_stb_o      => dwb_stb,
		dwb_we_o       => dwb_we,
		dwb_sel_o      => dwb_sel,
		dwb_dat_o      => dwb_dat_cpu2slave,
		-- dwb_cab_o => open,
		dwb_cti_o      => dwb_cti,
		dwb_bte_o      => dwb_bte,

		-- External Debug Interface
		dbg_stall_i    => dbg_stall,
		dbg_ewt_i      => dbg_ewt,
		dbg_lss_o      => dbg_lss,
		dbg_is_o       => dbg_is,
		dbg_wp_o       => dbg_wp,
		dbg_bp_o       => dbg_bp,
		dbg_stb_i      => dbg_stb,
		dbg_we_i       => dbg_we,
		dbg_adr_i      => dbg_adr,
		dbg_dat_i      => dbg_dat_slave2cpu,
		dbg_dat_o      => dbg_dat_cpu2slave,
		dbg_ack_o      => dbg_ack,

		-- Power Management
		pm_cpustall_i  => pm_cpustall,
		pm_clksd_o     => pm_clksd,
		pm_dc_gate_o   => pm_dc_gate,
		pm_ic_gate_o   => pm_ic_gate,
		pm_dmmu_gate_o => pm_dmmu_gate,
		pm_immu_gate_o => pm_immu_gate,
		pm_tt_gate_o   => pm_tt_gate,
		pm_cpu_gate_o  => pm_cpu_gate,
		pm_wakeup_o    => pm_wakeup,
		pm_lvolt_o     => pm_lvolt
	);

end architecture rtl;

