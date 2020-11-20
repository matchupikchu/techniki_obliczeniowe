library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package hamming is
	function hamming_weight (v: std_logic_vector)
	return natural;
end package;

package body hamming is
	function hamming_weight(v: std_logic_vector) return natural is
		constant size: natural := v'length;
		constant vv: std_logic_vector(size - 1 downto 0) := v;
		variable h: natural;
		begin
			h := 0;
			if size = 1 and vv(0) = '1' then
				h := 1;
			elsif size > 1 then
				h := hamming_weight(vv(size - 1 downto size / 2)) + hamming_weight(vv(size / 2 - 1 downto 0));
			end if;
		return h;
		end function hamming_weight;
end package body;