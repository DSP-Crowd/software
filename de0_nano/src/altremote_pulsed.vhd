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

library altera_mf;
use altera_mf.altera_mf_components.all;

entity altremote_pulsed is
    port
    (
        clk     : in  std_ulogic;
	reset   : in  std_ulogic;
	reconf  : in  std_ulogic  -- One clock cycle high => Reconf
    );
end entity altremote_pulsed;

architecture rtl of altremote_pulsed is

    component altremote
        port
        (
            clock           : in  std_logic;
            data_in         : in  std_logic_vector(21 downto 0);
            param           : in  std_logic_vector(2 downto 0);
            read_param      : in  std_logic;
            read_source     : in  std_logic_vector(1 downto 0);
            reconfig        : in  std_logic;
            reset           : in  std_logic;
            reset_timer     : in  std_logic;
            write_param     : in  std_logic;
            busy            : out std_logic;
            data_out        : out std_logic_vector(28 downto 0)
        );
    end component;

    type STATEMACHINE_STEP_TYPE is
    (
        SM_INIT, SM_SET_RESET, SM_WRITE_BOOT_ADDRESS, SM_TURN_OFF_WDT, SM_SET_EARLY_CONF_DONE_CHECK, SM_WRITE_PARAM, SM_WAIT_BUSY, SM_IDLE
    );

    type REG_TYPE is record
        sm_step             : STATEMACHINE_STEP_TYPE;
        sm_step_ret         : STATEMACHINE_STEP_TYPE;
        param               : std_logic_vector(2 downto 0);
        data_in             : std_logic_vector(21 downto 0);
        ar_reset_cnt        : natural;
    end record;

    constant RSET_INIT_VAL : REG_TYPE :=
    (
        sm_step             => SM_INIT,
        sm_step_ret         => SM_INIT,
        param               => "000",
        data_in             => (others => '0'),
        ar_reset_cnt        => 0
    );

    signal R, NxR           : REG_TYPE;
    signal clk_3            : std_ulogic;

    signal ar_data_in       : std_logic_vector(21 downto 0);
    signal ar_param         : std_logic_vector(2 downto 0);
    signal ar_reconfig      : std_logic;
    signal ar_reset         : std_logic;
    signal ar_write_param   : std_logic;
    signal ar_busy          : std_logic;

begin

    altremote_inst : altremote
    port map
    (
        clock               => clk_3,
        data_in             => ar_data_in,
        param               => ar_param,
        read_param          => '0',
        read_source         => "00",
        reconfig            => ar_reconfig,
        reset               => ar_reset,
        reset_timer         => '0',
        write_param         => ar_write_param,
        busy                => ar_busy,
        data_out            => open
    );

    eALTREMOTE_CLK: entity work.frequency_divider(rtl)
        generic map
        (
            divide_by     => 16
        )
        port map
        (
            clock         => clk,
            n_reset_async => reset,
            strobe_output => clk_3
        );

    proc_comb: process(R, reconf)
    begin

        NxR <= R;

        -- standard values
        ar_data_in <= (others => '0');
        ar_param <= "000";
        ar_write_param <= '0';
        ar_reconfig <= '0';
        ar_reset <= '0';

        -- fsm
        case R.sm_step is
            when SM_IDLE =>
                if(reconf = '1')then
                   ar_reconfig <= '1';
                end if;

            when SM_INIT =>
                NxR.sm_step <= SM_SET_RESET;

            when SM_SET_RESET =>
                ar_reset <= '1';

                if(R.ar_reset_cnt = 15)then
                    NxR.sm_step <= SM_WRITE_BOOT_ADDRESS;
                else
                    NxR.ar_reset_cnt <= R.ar_reset_cnt + 1;
                end if;

            when SM_WRITE_BOOT_ADDRESS =>
                NxR.param <= "100";
                NxR.data_in <= (others => '0');
                NxR.sm_step <= SM_WRITE_PARAM;
                NxR.sm_step_ret <= SM_TURN_OFF_WDT;

            when SM_TURN_OFF_WDT =>
                NxR.param <= "011";
                NxR.data_in <= (others => '0');
                NxR.sm_step <= SM_WRITE_PARAM;
                NxR.sm_step_ret <= SM_SET_EARLY_CONF_DONE_CHECK;

            when SM_SET_EARLY_CONF_DONE_CHECK =>
                NxR.param <= "001";
                NxR.data_in <= (others => '1');
                NxR.sm_step <= SM_WRITE_PARAM;
                NxR.sm_step_ret <= SM_IDLE;

            when SM_WRITE_PARAM =>
                ar_param <= R.param;
                ar_data_in <= R.data_in;
                ar_write_param <= '1';

                if(ar_busy = '1')then
                    NxR.sm_step <= SM_WAIT_BUSY;
                end if;

            when SM_WAIT_BUSY =>
                ar_data_in <= R.data_in;
                if(ar_busy = '0')then
                    NxR.sm_step <= R.sm_step_ret;
                end if;

            when others =>
                null;
        end case;

    end process;

    proc_reg: process(clk)
    begin
        if((clk'event) and (clk = '1'))then
            if(reset = '0')then
                R <= RSET_INIT_VAL;
            else
                R <= NxR;
            end if;
        end if;
    end process;

end architecture Rtl;
