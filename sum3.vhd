library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum3 is
	port(
			input0, input1: in std_logic_vector(2 downto 0);
			output: out std_logic_vector(3 downto 0)
		 );
end sum3;

architecture beh of sum3 is 

begin

	output <= std_logic_vector(resize(unsigned(input0) + unsigned(input1), output'length));

end beh;