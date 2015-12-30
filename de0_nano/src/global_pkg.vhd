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

package global is

	---------------------------------------------------------------------
	-- Functions
	---------------------------------------------------------------------
	function log_dualis(number : natural) return natural;

end global;

package body global is

	---------------------------------------------------------------------
	-- returns the logarithm of base 2
	function log_dualis(number : natural) return natural is
		variable needed_bits : natural := 0;
		variable running_bit : natural := 1;
	begin
		while running_bit < number loop
			needed_bits := needed_bits + 1;
			running_bit := running_bit * 2;
		end loop;

		return needed_bits;
	end log_dualis;
	---------------------------------------------------------------------

end global;

