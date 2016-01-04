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

entity frequencyDividerTb is
end frequencyDividerTb;

architecture rtl of frequencyDividerTb is

	----------------------------------------------------------------------------------
	-- Constants
	----------------------------------------------------------------------------------
	constant cSystemClock	: natural := 50E6;
	constant cDivider1	: natural := 4;
	constant cDivider2	: natural := 6;
	signal clock		: std_ulogic := '0';
	signal reset		: std_ulogic := '0';
	signal dutOutput1	: std_ulogic;
	signal dutOutput2	: std_ulogic;

begin

	clock <= not clock after 1E9 ns / (2 * cSystemClock);
	reset <= '1' after 200 ns;

	-- DUT
	DUT1: entity work.frequencyDivider(rtl)
	generic map
	(
		divideBy	=> cDivider1
	)
	port map
	(
		clock		=> clock,
		nResetAsync	=> reset,
		output		=> dutOutput1
	);

	DUT2: entity work.frequencyDivider(rtl)
	generic map
	(
		divideBy	=> cDivider2
	)
	port map
	(
		clock		=> clock,
		nResetAsync	=> reset,
		output		=> dutOutput2
	);

end architecture rtl;

