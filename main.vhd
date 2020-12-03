library ieee;
use ieee.std_logic_1164.all;

library genANF;
use genANF.all;

library transeuntTriangle;
use transeuntTriangle.all;

library xor_functions;
use xor_functions.all;

library ones_count;
use ones_count.all;

library min1;
use min1.all;

library hamming_approved;
use hamming_approved.all;

library decision;
use decision.all;

entity main is 
	port(
			clk: in std_logic;
			output: out std_logic_vector(15 downto 0)
		 );
end main;
		 
architecture beh of main is
	
	component genANF port (
									clk: in std_logic;
									reset: in std_logic;
									ANF: out std_logic_vector(15 downto 0)
								 );
	end component;
	
begin





end beh;