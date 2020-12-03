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

entity bentFuncSearch is 
	port(
			clk: in std_logic;
			output: out std_logic_vector(15 downto 0)
		 );
end bentFuncSearch;
		 
architecture beh of bentFuncSearch is
	
	component genANF port (
									clk: in std_logic;
									reset: in std_logic;
									ANF: out std_logic_vector(15 downto 0)
								 );
	end component;
	
	component transeuntTriangle port (
													ANF: in std_logic_vector(15 downto 0);
													TT: out std_logic_vector(15 downto 0)
												);
	end component;
	
	component xor_functions port (
											input: in std_logic_vector(15 downto 0);
											output: out std_logic_vector(511 downto 0)
										  );
	end component;
	
	
	component ones_count port(
										input: in std_logic_vector(511 downto 0);
										output: out std_logic_vector(159 downto 0)
									 );
	end component;
	
	component min1 port(
								input: in std_logic_vector(159 downto 0);
								output: out std_logic_vector(4 downto 0)
							 );
	end component;
	
	component hamming_approved port(
												input: in std_logic_vector(15 downto 0);
												output: out std_logic_vector(4 downto 0)
											 );
	end component;
	
	component decision port(
								  ANF: in std_logic_vector(15 downto 0);
								  weight: in std_logic_vector(4 downto 0);
								  distance:in std_logic_vector(4 downto 0);
								  output: out std_logic_vector(15 downto 0)
								  );
	end component;
	
	signal ANF1, TT1: std_logic_vector(15 downto 0);
	signal temp1: std_logic_vector(511 downto 0);
	signal temp2: std_logic_vector(159 downto 0);
	signal distance1, weight1: std_logic_vector(4 downto 0);
	signal koniec: std_logic_vector(15 downto 0);
	
begin

	ANF: genANF port map(
								clk => clk,
								reset => '0',
								ANF => ANF1
							  );
	
	ANFtoTT: transeuntTriangle port map(
													ANF => ANF1,
													TT => TT1
												  );
	xor_affine: xor_functions port map(
													input => TT1,
													output => temp1
												 );
	ones: ones_count port map(
										input => temp1,
										output => temp2
									 );
	dist: min1 port map(
								input => temp2,
								output => distance1
							);
	weight: hamming_approved port map(
												input => ANF1,
												output => weight1
											 );
	dec: decision port map(
									ANF => ANF1,
									weight => weight1,
									distance => distance1,
									output => koniec
								 );
	output <= koniec;
end beh;