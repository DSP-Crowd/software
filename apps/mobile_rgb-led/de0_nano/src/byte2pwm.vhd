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

entity byte2pwm is
	port
	(
		clock			: in  std_ulogic;
		n_reset_async		: in  std_ulogic;

		data			: in  std_ulogic_vector(7 downto 0);
		data_valid		: in  std_ulogic;

		led_pwm			: out std_ulogic
	);
end byte2pwm;

architecture rtl of byte2pwm is

	type REG_TYPE is record
		counter			: natural;
		counter_max		: natural;
	end record;

	constant RSET_INIT_VAL : REG_TYPE :=
	(
		counter			=> 0,
		counter_max		=> 0
	);

	signal R, NxR			: REG_TYPE;
	signal cnt_strobe		: std_ulogic;

begin

	proc_comb: process(R, data, data_valid, cnt_strobe)
	begin
		NxR <= R;

		if(cnt_strobe = '1')then
			if(R.counter < 254)then
				NxR.counter <= R.counter + 1;
			else
				NxR.counter <= 0;
			end if;
		end if;

		if(R.counter < R.counter_max)then
			led_pwm <= '1';
		else
			led_pwm <= '0';
		end if;

		if(data_valid = '1')then
			NxR.counter_max <= to_integer(unsigned(data));
		end if;

	end process;

	mainstrobe: entity work.strobe_gen(rtl)
	generic map
	(
		num_clock_cycles => 50E1 -- 1us strobe
		-- num_clock_cycles => 3 -- Test
	)
	port map
	(
		clock		=> clock,
		n_reset_async	=> n_reset_async,
		strobe_output	=> cnt_strobe
	);

	proc_reg: process(n_reset_async, clock)
	begin
		if(n_reset_async = '0')then
			R <= RSET_INIT_VAL;
		elsif(clock'event and clock = '1')then
			R <= NxR;
		end if;
	end process;

end architecture rtl;

