library ieee;
use ieee.std_logic_1164.all;

library suma4jednosci;
use suma4jednosci.all;

library sum3;
use sum3.all;

library sum4;
use sum4.all;

entity hamming_approved is
	port( input: in std_logic_vector(15 downto 0);
			output: out std_logic_vector(4 downto 0)
	);
end hamming_approved;

architecture beh of hamming_approved is

	component suma4jednosci port(
											input: in std_logic_vector(3 downto 0);
											output: out std_logic_vector(2 downto 0)
										 );
	end component;
	
	component sum3	port(
								input0, input1: in std_logic_vector(2 downto 0);
								output: out std_logic_vector(3 downto 0)
							 );
	end component;

	component sum4 port(
							  input0, input1: in std_logic_vector(3 downto 0);
							  output: out std_logic_vector(4 downto 0)
							 );
	end component;
	
	signal temp10, temp11, temp12, temp13: std_logic_vector(2 downto 0);
	signal temp20, temp21: std_logic_vector(3 downto 0);
	
begin

	firstLayer0: suma4jednosci port map(
													input => input(15 downto 12),
													output => temp10
												  );
												  
	firstLayer1: suma4jednosci port map(
													input => input(11 downto 8),
													output => temp11
												  );
												  
	firstLayer2: suma4jednosci port map(
													input => input(7 downto 4),
													output => temp12
												  );
												  
	firstLayer3: suma4jednosci port map(
													input => input(3 downto 0),
													output => temp13
												  );
												  
	secondLayer0: sum3 port map(
										input0 => temp10,
										input1 => temp11,
										output => temp20
										);
										
	secondLayer1: sum3 port map(
										input0 => temp12,
										input1 => temp13,
										output => temp21
										);
										
	thirdLayer0: sum4 port map(
										input0 => temp20,
										input1 => temp21,
										output => output
										);
												  
end beh;	
	