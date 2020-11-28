library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity ones_count is 
	port(
			input: in std_logic_vector(511 downto 0);
			output: out std_logic_vector(159 downto 0)
		 );
	end ones_count;
	
architecture beh of ones_count is

	component hamming port( input: in std_logic_vector(15 downto 0);
									output: out std_logic_vector(4 downto 0)
								 );
	end component;
	
begin

	hams: for i in 0 to 31 generate
		ham: hamming port map(
										input((i + 1) * 16 - 1 downto i * 16),
										output((i + 1) * 5 - 1 downto i * 5)
									);
	end generate hams;
	
																
																
end beh;