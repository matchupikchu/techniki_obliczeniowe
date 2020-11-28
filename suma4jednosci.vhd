library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library full_adder;
use full_adder.all;

library adk;
use adk.all;

entity suma4Jednosci is 
port(input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(2 downto 0)
	  );
end suma4Jednosci;

architecture behavioral of suma4Jednosci is

	signal tmpA2, tmpA3, tmpB2, tmpB3, tmpC3: std_logic;

	component full_adder 
		port(
				a, b, cin: in std_logic;
				sum, cout: out std_logic
			 );
	end component;
begin

	adder0: full_adder PORT MAP(
										 a => input(0),
										 b => input(1),
										 cin => '0',
										 sum => tmpA2,
										 cout => tmpA3
										 );
										 
	adder1: full_adder PORT MAP(
										 a => input(2),
										 b => input(3),
										 cin => '0',
										 sum => tmpB2,
										 cout => tmpB3
										 );
										 
	adder2: full_adder PORT MAP(
										 a => tmpA2,
										 b => tmpB2,
										 cin => '0',
										 sum => output(0),
										 cout => tmpC3
										 );
										 
	adder3: full_adder PORT MAP(
										 a => tmpA3,
										 b => tmpB3,
										 cin => tmpC3,
										 sum => output(1),
										 cout => output(2)
										 );
										 
										 		
	
end behavioral;