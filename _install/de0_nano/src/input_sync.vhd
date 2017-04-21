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

entity input_sync is
	generic
	(
		num_inputs      : integer := 1;
		num_sync_stages : integer := 1
	);
	port
	(
		clock           : in std_ulogic;
		n_reset_async   : in std_ulogic;
		unsynced_inputs : in  std_ulogic_vector(num_inputs - 1 downto 0);
		synced_outputs  : out std_ulogic_vector(num_inputs - 1 downto 0)
	);
begin
	assert 0 < num_inputs report "'num_inputs' must be greater than zero" severity error;
	assert 0 < num_sync_stages report "'num_sync_stages' must be greater than zero" severity error;
end input_sync;

architecture rtl of input_sync is
	type stages is array (0 to num_sync_stages - 1) of std_ulogic_vector(num_inputs - 1 downto 0);
	signal q : stages;
begin

	process(clock)
	begin
		if(clock'event and clock = '1') then
			if('0' = n_reset_async) then
				q(0) <= (others => '0');
			else
				q(0) <= unsynced_inputs;
			end if;
		end if;
	end process;

	lbl_stages: for i in 0 to num_sync_stages - 2 generate
		process(clock)
		begin
			if(clock'event and clock = '1') then
				q(i + 1) <= q(i);
			end if;
		end process;
	end generate;

	synced_outputs <= q(num_sync_stages - 1);

end architecture rtl;

