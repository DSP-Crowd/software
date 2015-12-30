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
	pulse   : in  std_ulogic
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

    constant USR_CONFIGREG      : natural := 3;
    constant USR_CONFIG_ALTREMOTE_RECONF : natural := 0;
    
    subtype byte is std_logic_vector(7 downto 0);
    type REGISTER_SET_TYPE is array (0 to 7) of byte;
    type STATEMACHINE_STEP_TYPE is
    (
        SM_INIT, SM_SET_RESET, SM_WRITE_BOOT_ADDRESS, SM_TURN_OFF_WDT, SM_SET_EARLY_CONF_DONE_CHECK, SM_WRITE_PARAM, SM_WAIT_BUSY, SM_IDLE
    );

    type REG_TYPE is record
        rset                : REGISTER_SET_TYPE;
        sm_step             : STATEMACHINE_STEP_TYPE;
        sm_step_ret         : STATEMACHINE_STEP_TYPE;
        param               : std_logic_vector(2 downto 0);
        data_in             : std_logic_vector(21 downto 0);
        ar_reset_cnt        : natural;
    end record;
    
    constant RSET_INIT_VAL : REG_TYPE :=
    (
        rset                => (others => (others => '0')),
        sm_step             => SM_INIT,
        sm_step_ret         => SM_INIT,
        param               => "000",
        data_in             => (others => '0'),
        ar_reset_cnt        => 0
    );
    
    signal R, NxR           : REG_TYPE;
    signal rstint           : std_ulogic;
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
    
    eALTREMOTE_CLK: entity work.FreqDivider(Rtl)
        generic map
        (
            gDivideBy    => 16
        )
        port map
        (
            iClk         => clk,
            inResetAsync => rstint,
            oDivdClk     => clk_3
        );

    proc_comb: process(R, pulse)
    begin
    
        NxR <= R;
        
        -- standard values
        ar_data_in <= (others => '0');
        ar_param <= "000";
        ar_write_param <= '0';
        ar_reconfig <= R.rset(USR_CONFIGREG)(USR_CONFIG_ALTREMOTE_RECONF);
        ar_reset <= '0';

        -- write memory mapped addresses
        if((extsel = '1') and (exti.write_en = '1'))then
            case exti.addr(4 downto 2) is
                when "000" =>
                    if((exti.byte_en(0) = '1') or (exti.byte_en(1) = '1'))then
                        NxR.rset(STATUSREG)(STA_INT) <= '1';
                        NxR.rset(CONFIGREG)(CONF_INTA) <= '0';
                    else
                        if(exti.byte_en(2) = '1')then
                            NxR.rset(CONFIGREG) <= exti.data(23 downto 16);
                        end if;
                        if(exti.byte_en(3) = '1')then
                            NxR.rset(USR_CONFIGREG) <= exti.data(31 downto 24);
                        end if;
                    end if;

                when others =>
                    null;
            end case;
        end if;
        
        -- read memory mapped addresses
        exto.data <= (others => '0');
        if((extsel = '1') and (exti.write_en = '0'))then
            case exti.addr(4 downto 2) is
                when "000" =>
                    exto.data <= R.rset(3) & R.rset(2) & R.rset(1) & R.rset(0);
                when "001" =>
                    if(R.rset(CONFIGREG)(CONF_ID) = '1')then
                        exto.data <= MODULE_VER & MODULE_ID;
                    else
                        exto.data <= R.rset(7) & R.rset(6) & R.rset(5) & R.rset(4);
                    end if;
                when others =>
                    null;
            end case;
        end if;
        
        -- compute status flags
        NxR.rset(STATUSREG)(STA_LOOR) <= R.rset(CONFIGREG)(CONF_LOOW);
        NxR.rset(STATUSREG)(STA_FSS) <= '0';
        NxR.rset(STATUSREG)(STA_RESH) <= '0';
        NxR.rset(STATUSREG)(STA_RESL) <= '0';
        NxR.rset(STATUSREG)(STA_BUSY) <= '0';
        NxR.rset(STATUSREG)(STA_ERR) <= '0';
        NxR.rset(STATUSREG)(STA_RDY) <= '1';
        
        -- set output enabled (default)
        NxR.rset(CONFIGREG)(CONF_OUTD) <= '1';

        -- module specific part
        case R.sm_step is
            when SM_IDLE =>
                null;
        
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

        -- combine soft- and hard-reset
        rstint <= not RST_ACT;
        if((exti.reset = RST_ACT) or (R.rset(CONFIGREG)(CONF_SRES) = '1'))then
            rstint <= RST_ACT;
        end if;

        -- reset interrupt
        if((R.rset(STATUSREG)(STA_INT) = '1') and (R.rset(CONFIGREG)(CONF_INTA) = '0'))then
            NxR.rset(STATUSREG)(STA_INT) <= '0';
        end if;
        exto.intreq <= R.rset(STATUSREG)(STA_INT);

    end process;

    proc_reg: process(clk)
    begin
        if((clk'event) and (clk = '1'))then
            if(reset = RST_ACT)then
                R <= RSET_INIT_VAL;
            else
                R <= NxR;
            end if;
        end if;
    end process;

end architecture Rtl;
