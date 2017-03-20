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
--  Copyright (C) 2015 Authors and www.dsp-crowd.com                       --
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

entity spi2rgb is
	port
	(
		clock			: in  std_ulogic;
		n_reset_async		: in  std_ulogic;

		spi_cs			: in  std_ulogic;
		spi_clk			: in  std_ulogic;
		spi_mosi		: in  std_ulogic;

		data			: out SPI2RGB_DATA_TYPE;
		valid_bits		: out std_ulogic_vector(SPI2RGB_NUM_DATA_BYTES - 1 downto 0)
	);
end spi2rgb;

architecture rtl of spi2rgb is

	type STATEMACHINE_STEP_TYPE is
	(
		SM_WAIT_CS_LOW, SM_GET_DATA_BIT, SM_WAIT_CLK_LOW
	);

	type REG_TYPE is record
		sm_step			: STATEMACHINE_STEP_TYPE;
		bit_idx			: natural;
		byte_idx		: natural;
		tmp			: std_ulogic_vector(7 downto 0);
		logging_done		: std_ulogic;
	end record;

	constant RSET_INIT_VAL : REG_TYPE :=
	(
		sm_step			=> SM_WAIT_CS_LOW,
		bit_idx			=> 0,
		byte_idx		=> 0,
		tmp			=> (others => '0'),
		logging_done		=> '0'
	);

	signal R, NxR			: REG_TYPE;

begin

	proc_comb: process(R, spi_cs, spi_clk, spi_mosi)
	begin
		NxR <= R;
		valid_bits <= (others => '0');

		case R.sm_step is
			when SM_WAIT_CS_LOW =>
				if(spi_cs = '0' and R.logging_done = '0')then
					NxR.sm_step <= SM_GET_DATA_BIT;
					NxR.bit_idx <= 7;
					NxR.byte_idx <= 4;
				end if;

			when SM_GET_DATA_BIT =>
				if(spi_clk = '1')then
					NxR.sm_step <= SM_WAIT_CLK_LOW;
					NxR.tmp(R.bit_idx) <= spi_mosi;
				end if;

			when SM_WAIT_CLK_LOW =>
				if(spi_clk = '0')then
					NxR.sm_step <= SM_GET_DATA_BIT;

					if(R.bit_idx = 0)then
						NxR.bit_idx <= 7;

						if(R.byte_idx < 3)then
							data(R.byte_idx) <= R.tmp;
							valid_bits(R.byte_idx) <= '1';
						end if;

						if(R.byte_idx = 0)then
							NxR.logging_done <= '1';
							NxR.sm_step <= SM_WAIT_CS_LOW;
						else
							NxR.byte_idx <= R.byte_idx - 1;
						end if;
					else
						NxR.bit_idx <= R.bit_idx - 1;
					end if;
				end if;

			when others =>
				NxR.logging_done <= '0';
				NxR.sm_step <= SM_WAIT_CS_LOW;
		end case;

		if(spi_cs = '1')then
			NxR.logging_done <= '0';
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

