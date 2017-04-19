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

entity tb_rr_base is
end tb_rr_base;

architecture bhv of tb_rr_base is

	----------------------------------------------------------------------------------
	-- Constants
	----------------------------------------------------------------------------------
	-- System
	constant c_spi_rate         : natural := 99E5; -- Should be something weird => Detect more errors
	constant c_bit_with_half_t  : time := 1E9 ns / c_spi_rate;
	constant c_byte_pad_t       : time := 5 * c_bit_with_half_t;
	constant SPI_USER_CS_IDX    : natural := 1;

	-- User
	constant c_clk_frequency  : natural := 50E6;
	constant c_use_issi_sdram : std_ulogic := '1';
	constant c_use_sdram_pll  : std_ulogic := '1';
	constant num_gpios        : natural := 6;
	-- Derived

	----------------------------------------------------------------------------------
	-- Signals
	----------------------------------------------------------------------------------
	signal clk                : std_ulogic := '1';

	signal keys               : std_ulogic_vector(1 downto 0);
	signal switches           : std_ulogic_vector(3 downto 0);
	signal leds               : std_ulogic_vector(7 downto 0);

	signal gdb_tx             : std_ulogic := '1';
	signal gdb_rx             : std_ulogic;

	signal spi_cs             : std_ulogic_vector(1 downto 0) := (others => '1');
	signal spi_clk            : std_ulogic := '0';
	signal spi_mosi           : std_ulogic := '0';
	signal spi_miso           : std_ulogic := '0';

	signal spi_epcs_cs        : std_ulogic;
	signal spi_epcs_clk       : std_ulogic;
	signal spi_epcs_mosi      : std_ulogic;
	signal spi_epcs_miso      : std_ulogic;

	signal arReconf           : std_ulogic;

	signal gpios              : std_logic_vector(0 to num_gpios - 1);

	signal sdram_addr         : std_logic_vector(12 downto 0);
	signal sdram_ba           : std_logic_vector(1 downto 0);
	signal sdram_cke          : std_logic;
	signal sdram_clk          : std_logic;
	signal sdram_cs_n         : std_logic;
	signal sdram_dq           : std_logic_vector(15 downto 0);
	signal sdram_dqm          : std_logic_vector(1 downto 0);
	signal sdram_cas_n        : std_logic;
	signal sdram_ras_n        : std_logic;
	signal sdram_we_n         : std_logic;
	signal sdram_ctrl_str     : string(1 to 5);

begin

	clk <= not clk after 1E9 ns / (2 * c_clk_frequency);
	keys <= (others => '1');
	switches <= (others => '0');

	testbed: entity work.tbd_rr_base(rtl)
	generic map
	(
		use_sdram_pll => c_use_sdram_pll,
		num_gpios     => num_gpios
	)
	port map
	(
		clock_50mhz       => clk,

		keys              => keys,
		switches          => switches,
		leds              => leds,

		uart_rx           => gdb_tx,
		uart_tx           => gdb_rx,

		spi_cs            => spi_cs,
		spi_clk           => spi_clk,
		spi_mosi          => spi_mosi,
		spi_miso          => spi_miso,

		spi_epcs_cs       => spi_epcs_cs,
		spi_epcs_clk      => spi_epcs_clk,
		spi_epcs_mosi     => spi_epcs_mosi,
		spi_epcs_miso     => spi_epcs_miso,

		arReconf          => arReconf,

		gpios		  => gpios,

		sdram_addr        => sdram_addr,
		sdram_ba          => sdram_ba,
		sdram_cke         => sdram_cke,
		sdram_clk         => sdram_clk,
		sdram_cs_n        => sdram_cs_n,
		sdram_dq          => sdram_dq,
		sdram_dqm         => sdram_dqm,
		sdram_cas_n       => sdram_cas_n,
		sdram_ras_n       => sdram_ras_n,
		sdram_we_n        => sdram_we_n
	);

	altera_sdram : if (c_use_issi_sdram = '0') generate
	eSDRAM : entity work.sdram_0_test_component(europa)
	port map
	(
		-- inputs:
		clk             => sdram_clk,
		ZS_ADDR         => sdram_addr,
		zs_ba           => sdram_ba,
		zs_cas_n        => sdram_cas_n,
		zs_cke          => sdram_cke,
		zs_cs_n         => sdram_cs_n,
		zs_dqm          => sdram_dqm,
		zs_ras_n        => sdram_ras_n,
		zs_we_n         => sdram_we_n,

		-- outputs:
		zs_dq           => sdram_dq
	);
	end generate;

	issi_sdram : if (c_use_issi_sdram = '1') generate
	eSDRAM_issi : entity work.IS42S16160
	port map
	(
		Dq              => sdram_dq,
		Addr            => sdram_addr,
		Ba              => sdram_ba,
		Clk             => sdram_clk,
		Cke             => sdram_cke,
		Cs_n            => sdram_cs_n,
		Ras_n           => sdram_ras_n,
		Cas_n           => sdram_cas_n,
		We_n            => sdram_we_n,
		Dqm             => sdram_dqm
	);
	end generate;

	sdram_ctrl_debug: process(sdram_cs_n, sdram_ras_n, sdram_cas_n, sdram_we_n)
		variable ctrl_vect : std_logic_vector(2 downto 0);
	begin
		ctrl_vect := sdram_ras_n & sdram_cas_n & sdram_we_n;

		if(sdram_cs_n = '1')then
			sdram_ctrl_str <= "DESL ";
		else
			case ctrl_vect is
			when "111" =>
				sdram_ctrl_str <= "NOP  ";
			when "101" =>
				sdram_ctrl_str <= "READ ";
			when "100" =>
				sdram_ctrl_str <= "WRITE";
			when "011" =>
				sdram_ctrl_str <= "ACT  ";
			when "010" =>
				sdram_ctrl_str <= "PALL ";
			when "001" =>
				sdram_ctrl_str <= "REF  ";
			when "000" =>
				sdram_ctrl_str <= "MRS  ";
			when others =>
				sdram_ctrl_str <= "???  ";
			end case;
		end if;
	end process;


----------------------------------------------------------------------------------------------------------------------------
-- Testing process
Stimu : process

        procedure spi_select is
        begin
            wait for c_byte_pad_t;
            wait for c_byte_pad_t;
            spi_cs(SPI_USER_CS_IDX) <= '0';
            wait for c_byte_pad_t;
        end procedure;

        procedure spi_deselect is
        begin
            wait for c_byte_pad_t;
            spi_cs(SPI_USER_CS_IDX) <= '1';
            wait for c_byte_pad_t;
            wait for c_byte_pad_t;
        end procedure;

        procedure spi_send_byte(dat : in std_ulogic_vector(7 downto 0)) is
        begin
            for i in 7 downto 0 loop
                spi_mosi <= dat(i);
                wait for c_bit_with_half_t;
                spi_clk <= '1';
                wait for c_bit_with_half_t;
                spi_clk <= '0';
            end loop;
            spi_mosi <= '0';
            wait for c_byte_pad_t;
        end procedure;

        procedure spi_send_byte_broken(dat : in std_ulogic_vector(7 downto 0)) is
        begin
            for i in 3 downto 0 loop
                spi_mosi <= dat(i);
                wait for c_bit_with_half_t;
                spi_clk <= '1';
                wait for c_bit_with_half_t;
                spi_clk <= '0';
            end loop;
            spi_mosi <= '0';
            wait for c_byte_pad_t;
        end procedure;

  begin

-- ########################################################################################################
-----------------------------------------------------------------------------------------------------------
-- Testing Code
	wait for 10 ns;

	gpios <= (others => 'H');

	wait for 1 us;

	spi_select;

	gpios(2) <= 'L';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	--spi_send_byte(X"C3"); -- Garbage

	wait for 1 us;

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- OUT
	spi_send_byte(X"01");
	spi_send_byte(X"00");
	--spi_send_byte(X"C3"); -- Garbage

	spi_send_byte(X"02"); -- OUT
	spi_send_byte(X"01");
	spi_send_byte(X"01");
	--spi_send_byte(X"C3"); -- Garbage

	spi_send_byte(X"02"); -- OUT
	spi_send_byte(X"01");
	spi_send_byte(X"00");

	wait for 1 us;

	gpios(2) <= 'L';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"01");
	--spi_send_byte(X"C3"); -- Garbage

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"02");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"04");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"03");

	wait for 1 us;

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'L';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	--spi_send_byte(X"00");

	spi_deselect;

	spi_select;

	gpios(2) <= 'L';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	wait for 1 us;

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- OUT
	spi_send_byte(X"01");
	spi_send_byte(X"00");

	spi_send_byte(X"02"); -- OUT
	spi_send_byte(X"01");
	spi_send_byte(X"01");

	spi_send_byte(X"02"); -- OUT
	spi_send_byte(X"01");
	spi_send_byte(X"00");

	wait for 1 us;

	gpios(2) <= 'L';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"01");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"02");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"04");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	wait for 1 us;

	spi_send_byte(X"02"); -- PWM
	spi_send_byte(X"02");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"05");

	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"00");
	spi_send_byte(X"03");

	wait for 1 us;

	gpios(2) <= 'H';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	gpios(2) <= 'L';
	spi_send_byte(X"02"); -- IN
	spi_send_byte(X"00");
	spi_send_byte(X"00");

	spi_deselect;

-----------------------------------------------------------------------------------------------------------
-- ########################################################################################################

    assert false report "SIMULATION ENDED SUCCESSFULLY" severity note;
    wait;

end process;

----------------------------------------------------------------------------------------------------------------------------

end bhv;

