library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ham;
use ham.hamming.all;

entity sumMaxWord is
generic (N: integer := 4);
port(
		input: in std_logic_vector((N ** 2) - 1 downto 0);
		output: out std_logic_vector(N downto 0)
		);
end sumMaxWord;

architecture sumMaxWord of sumMaxWord is 

signal in06, in713: std_logic_vector(6 downto 0);
signal in1415: std_logic_vector(1 downto 0);
signal q0, q1: std_logic_vector(2 downto 0);
signal a, b, c: std_logic_vector(4 downto 0);
--signal doneq0, doneq1: std_logic;

begin
	in06 <= input(6 downto 0);
	in713 <= input(13 downto 7);
	in1415 <= input(15 downto 14);
	
	first: process(in06)
		begin
			q0 <= std_logic_vector(to_unsigned(hamming_weight(in06), q0'length));
--			doneq0 <= '1';
	end process;

	second: process(in713)
		begin 
			q1 <= std_logic_vector(to_unsigned(hamming_weight(in713), q1'length));
--			doneq1 <= '1';
	end process;
--	
	plus3: process(q0, q1, in1415)
		begin
--			wait until doneq0 = '1' and doneq1 = '1';
				output <= std_logic_vector(resize(unsigned(q0), output'length)
				+ resize(unsigned(q1), output'length) 
				+ resize(to_unsigned(hamming_weight(in1415), output'length), output'length));
	end process;
	
end sumMaxWord; 