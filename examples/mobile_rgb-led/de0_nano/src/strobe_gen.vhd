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

entity strobe_gen is
	generic
	(
		num_clock_cycles	: natural := 1
	);
	port
	(
		clock			: in  std_ulogic;
		n_reset_async		: in  std_ulogic;
		strobe_output		: out std_ulogic
	);
begin
	assert (num_clock_cycles >= 1)
		report "strobe_gen: num_clock_cycles must be at least 1"
		severity error;
end strobe_gen;

architecture rtl of strobe_gen is

	type REG_TYPE is record
		counter			: natural;
	end record;

	constant RSET_INIT_VAL : REG_TYPE :=
	(
		counter			=> 0
	);

	signal R, NxR			: REG_TYPE;

begin

	proc_comb: process(R)
	begin

		NxR <= R;

		NxR.counter <= R.counter + 1;
		strobe_output <= '0';

		if(R.counter = num_clock_cycles - 1)then
			NxR.counter <= 0;
			strobe_output <= '1';
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

