library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ham;
use ham.hamming.all;

entity sum is
generic (N: integer := 4);
port(
		input: in std_logic_vector((2 ** N) - 1 downto 0);
		output: out std_logic_vector(N downto 0)
		);
end sum;

architecture sum of sum is 

signal in03, in47, in811, in1215: std_logic_vector(3 downto 0);
signal q0, q1, q2, q3: std_logic_vector(2 downto 0);
signal a1, a2, b1, b2: std_logic_vector(4 downto 0);
signal A, B:std_logic_vector(3 downto 0);
--signal doneq0, doneq1, doneq2, doneq3, doneA, doneB: std_logic;
begin
	in03 <= input(3 downto 0);
	in47 <= input(7 downto 4); 
	in811 <= input(11 downto 8);
	in1215 <= input(15 downto 12);
	
	first: process(in03)
		begin
			q0 <= std_logic_vector(to_unsigned(hamming_weight(in03), q0'length));
--			doneq0 <= '1';
	end process;

	second: process(in47)
		begin
			q1 <= std_logic_vector(to_unsigned(hamming_weight(in47), q1'length));
--			doneq1 <= '1';
	end process;
 
	third: process(in811)
		begin
			q2 <= std_logic_vector(to_unsigned(hamming_weight(in811), q2'length));
--			doneq2 <= '1';
	end process;
	
	fourth: process(in1215)
		begin
			q3 <= std_logic_vector(to_unsigned(hamming_weight(in1215), q3'length));
--			doneq3 <= '1';
	end process;
	
	plus3first: process(q0, q1)
		begin
--			wait until doneq0 = '1' and doneq1 = '1';
				 A <= std_logic_vector(resize(unsigned(q0) + unsigned(q1), A'length));
--				 doneA <= '1';
	end process;
	
	plus3second: process(q2, q3)
		begin
--			wait until doneq2 = '1' and doneq3 = '1';
				 B <= std_logic_vector(resize(unsigned(q2) + unsigned(q3), B'length));
--				 doneB <= '1';
	end process;
	
	plus4: process(A, B)
		begin 
--			wait until doneA = '1' and doneB = '1';
				output <= std_logic_vector(resize(unsigned(A) + unsigned(B), output'length));
	end process;
	
end sum; 