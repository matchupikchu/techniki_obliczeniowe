library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity decision is
	port(
	ANF: in std_logic_vector(15 downto 0);
	weight: in std_logic_vector(4 downto 0);
	distance: in std_logic_vector(4 downto 0);
	output: out std_logic_vector(15 downto 0)
	);
end decision;

architecture beh of decision is
begin

output <= ANF when((unsigned(weight) = 6 or unsigned(weight) = 10) and unsigned(distance) = 6)
				  else x"0000";


end beh;