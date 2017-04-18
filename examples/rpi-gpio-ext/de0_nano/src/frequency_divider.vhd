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

use work.global.all;

entity frequencyDivider is
	generic
	(
		divideBy	: integer := 2
	);
	port
	(
		clock		: in  std_ulogic;
		nResetAsync	: in  std_ulogic;
		output		: out std_ulogic
	);

begin

	assert (divideBy >= 4)
		report "frequencyDivider: divideBy must be at least 4"
		severity error;

	assert (divideBy rem 2 = 0)
		report "frequencyDivider: divideBy must be an even number"
		severity error;

end frequencyDivider;

architecture rtl of frequencyDivider is

	constant cHalfPeriodCounter : natural := divideBy / 2;
	signal counter : unsigned(logDualis(cHalfPeriodCounter) - 1 downto 0);
	signal sOutput : std_ulogic;

begin

	procReset: process(nResetAsync, clock)
	begin
		if(nResetAsync = '0')then

			counter <= (others => '0');
			sOutput <= '0';

		elsif(clock'event and clock = '1')then

			if(counter = cHalfPeriodCounter - 1)then
				counter <= (others => '0');
				sOutput <= not(sOutput);
			else
				counter <= counter + 1;
			end if;

		end if;
	end process;

	output <= sOutput;

end architecture rtl;
