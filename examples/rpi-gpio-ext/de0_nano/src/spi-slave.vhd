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

entity spi_slave is
	port
	(
		clock			: in  std_ulogic;
		n_reset_async		: in  std_ulogic;

		spi_cs			: in  std_ulogic;
		spi_clk			: in  std_ulogic;
		spi_mosi		: in  std_ulogic;
		spi_miso		: out std_ulogic;

		data			: out std_ulogic_vector(7 downto 0);
		data_is_id		: out std_ulogic;
		data_valid		: out std_ulogic;

		input_state		: in  std_ulogic;
		input_state_valid	: in  std_ulogic;
		cmd_done		: in  std_ulogic
	);
end spi_slave;

architecture rtl of spi_slave is

	type STATEMACHINE_BIT_STEP_TYPE is
	(
		SMB_IDLE, SMB_GET_DATA_BIT, SMB_WAIT_CLK_LOW
	);

	type STATEMACHINE_MAIN_STEP_TYPE is
	(
		SM_WAIT_CS_LOW, SM_GET_ID, SM_GET_DATA
	);

	type REG_TYPE is record
		smb_step		: STATEMACHINE_BIT_STEP_TYPE;
		sm_step			: STATEMACHINE_MAIN_STEP_TYPE;
		spi_byte		: std_ulogic_vector(7 downto 0);
		spi_byte_done		: std_ulogic;
		bit_idx			: natural;
		input_state		: std_ulogic;
	end record;

	constant RSET_INIT_VAL : REG_TYPE :=
	(
		smb_step		=> SMB_IDLE,
		sm_step			=> SM_WAIT_CS_LOW,
		spi_byte		=> (others => '0'),
		spi_byte_done		=> '0',
		bit_idx			=> 0,
		input_state		=> '0'
	);

	signal R, NxR			: REG_TYPE;

begin

	proc_comb: process(R, spi_cs, spi_clk, spi_mosi, input_state, input_state_valid, cmd_done)
	begin
		NxR <= R;
		NxR.spi_byte_done <= '0';

		data <= (others => '0');
		data_is_id <= '0';
		data_valid <= '0';

		if(R.bit_idx = 0)then
			spi_miso <= R.input_state;
		else
			spi_miso <= '0';
		end if;

		case R.smb_step is
			when SMB_GET_DATA_BIT =>
				if(spi_clk = '1')then
					NxR.smb_step <= SMB_WAIT_CLK_LOW;
					NxR.spi_byte(R.bit_idx) <= spi_mosi;
				end if;

			when SMB_WAIT_CLK_LOW =>
				if(spi_clk = '0')then
					NxR.smb_step <= SMB_GET_DATA_BIT;

					if(R.bit_idx = 0)then
						NxR.smb_step <= SMB_IDLE;
						NxR.bit_idx <= 7;

						NxR.spi_byte_done <= '1';
					else
						NxR.bit_idx <= R.bit_idx - 1;
					end if;
				end if;

			when others =>
				NxR.smb_step <= SMB_IDLE;
				NxR.bit_idx <= 7;
				NxR.spi_byte_done <= '0';
		end case;

		case R.sm_step is
			when SM_WAIT_CS_LOW =>
				if(spi_cs = '0')then
					NxR.smb_step <= SMB_GET_DATA_BIT;
					NxR.sm_step <= SM_GET_ID;
				end if;

			when SM_GET_ID =>
				if(R.spi_byte_done = '1')then
					data <= R.spi_byte;
					data_is_id <= '1';

					NxR.smb_step <= SMB_GET_DATA_BIT;
					NxR.sm_step <= SM_GET_DATA;
				end if;

			when SM_GET_DATA =>
				if(R.spi_byte_done = '1')then
					data <= R.spi_byte;
					data_valid <= '1';

					NxR.smb_step <= SMB_GET_DATA_BIT;
				end if;

			when others =>
				NxR.sm_step <= SM_WAIT_CS_LOW;
		end case;

		if(input_state_valid = '1')then
			NxR.input_state <= input_state;
		end if;

		if(cmd_done = '1')then
			NxR.input_state <= '0';

			NxR.smb_step <= SMB_GET_DATA_BIT;
			NxR.sm_step <= SM_GET_ID;
		end if;

		if(spi_cs = '1')then
			NxR.smb_step <= SMB_IDLE;
			NxR.sm_step <= SM_WAIT_CS_LOW;
		end if;

	end process;

	proc_reg: process(n_reset_async, clock)
	begin
		if(n_reset_async = '0')then
			R <= RSET_INIT_VAL;
		elsif(clock'event and clock = '1')then
			R <= NxR;
		end if;
	end process;

end architecture rtl;
