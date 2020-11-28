library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity min1 is 
	port(
			input: in std_logic_vector(159 downto 0);
			output: out std_logic_vector(4 downto 0)
		 );
	end min1;
	
architecture beh of min1 is

	component hamming port( input: in std_logic_vector(15 downto 0);
									output: out std_logic_vector(4 downto 0)
								 );
	end component;
	
	signal temp: std_logic_vector(79 downto 0);
	signal temp1: std_logic_vector(39 downto 0);
	signal temp2: std_logic_vector(19 downto 0);
	signal temp3: std_logic_vector(9 downto 0);
	
begin
-- Tu musisz wszystko zrobić połowicznie pierwsza kolumna jest uzupełniona
	
	temp(79 downto 75) <= input(159 downto 155) when(to_integer(unsigned(input(159 downto 155))) < to_integer(unsigned(input(154 downto 150))))
															  else input(154 downto 150);
	temp(74 downto 70) <= input(149 downto 145) when(to_integer(unsigned(input(149 downto 145))) < to_integer(unsigned(input(144 downto 140))))
															  else input(144 downto 140);														  
	temp(69 downto 65) <= input(139 downto 135) when(to_integer(unsigned(input(139 downto 135))) < to_integer(unsigned(input(134 downto 130))))
															  else input(134 downto 130);
	temp(64 downto 60) <= input(129 downto 125) when(to_integer(unsigned(input(129 downto 125))) < to_integer(unsigned(input(124 downto 120))))
															  else input(124 downto 120);
	temp(59 downto 55) <= input(119 downto 115) when(to_integer(unsigned(input(119 downto 115))) < to_integer(unsigned(input(114 downto 110))))
															  else input(114 downto 110);
	temp(54 downto 50) <= input(109 downto 105) when(to_integer(unsigned(input(109 downto 105))) < to_integer(unsigned(input(104 downto 100))))
															  else input(104 downto 100);
	temp(49 downto 45) <= input(99 downto 95) when(to_integer(unsigned(input(99 downto 95))) < to_integer(unsigned(input(94 downto 90))))
															  else input(94 downto 90);
	temp(44 downto 40) <= input(89 downto 85) when(to_integer(unsigned(input(89 downto 85))) < to_integer(unsigned(input(84 downto 80))))
															  else input(84 downto 80);															  
	temp(39 downto 35) <= input(79 downto 75) when(to_integer(unsigned(input(79 downto 75))) < to_integer(unsigned(input(74 downto 70))))
															  else input(74 downto 70);
	temp(34 downto 30) <= input(69 downto 65) when(to_integer(unsigned(input(69 downto 65))) < to_integer(unsigned(input(64 downto 60))))
															  else input(64 downto 60);
	temp(29 downto 25) <= input(59 downto 55) when(to_integer(unsigned(input(59 downto 55))) < to_integer(unsigned(input(54 downto 50))))
															  else input(54 downto 50);
	temp(24 downto 20) <= input(49 downto 45) when(to_integer(unsigned(input(49 downto 45))) < to_integer(unsigned(input(44 downto 40))))
															  else input(44 downto 40);
	temp(19 downto 15) <= input(39 downto 35) when(to_integer(unsigned(input(39 downto 35))) < to_integer(unsigned(input(34 downto 30))))
															  else input(34 downto 30);
	temp(14 downto 10) <= input(29 downto 25) when(to_integer(unsigned(input(29 downto 25))) < to_integer(unsigned(input(24 downto 20))))
															  else input(24 downto 20);
	temp(9 downto 5) <= input(19 downto 15) when(to_integer(unsigned(input(19 downto 15))) < to_integer(unsigned(input(14 downto 10))))
															  else input(14 downto 10);
	temp(4 downto 0) <= input(9 downto 5) when(to_integer(unsigned(input(9 downto 5))) < to_integer(unsigned(input(4 downto 0))))
															  else input(4 downto 0);

															  
-----------------------------Kolejny poziom drzewa -----------------------
	temp1(39 downto 35) <= temp(79 downto 75) when (to_integer(unsigned(temp (79 downto 75))) < to_integer(unsigned(temp(74 downto 70))))
															else temp(74 downto 70);
	temp1(34 downto 30) <= temp(69 downto 65) when (to_integer(unsigned(temp (69 downto 65))) < to_integer(unsigned(temp(64 downto 60))))
															else temp(64 downto 60);
	temp1(29 downto 25) <= temp(59 downto 55) when (to_integer(unsigned(temp (59 downto 55))) < to_integer(unsigned(temp(54 downto 50))))
															else temp(54 downto 50);
	temp1(24 downto 20) <= temp(49 downto 45) when (to_integer(unsigned(temp (49 downto 45))) < to_integer(unsigned(temp(44 downto 40))))
															else temp(44 downto 40);
	temp1(19 downto 15) <= temp(39 downto 35) when (to_integer(unsigned(temp (39 downto 35))) < to_integer(unsigned(temp(34 downto 30))))
															else temp(34 downto 30);
	temp1(14 downto 10) <= temp(29 downto 25) when (to_integer(unsigned(temp (29 downto 25))) < to_integer(unsigned(temp(24 downto 20))))
															else temp(24 downto 20);
	temp1(9 downto 5) <= temp(19 downto 15) when (to_integer(unsigned(temp (19 downto 15))) < to_integer(unsigned(temp(14 downto 10))))
															else temp(14 downto 10);
	temp1(4 downto 0) <= temp(9 downto 5) when (to_integer(unsigned(temp (9 downto 5))) < to_integer(unsigned(temp(4 downto 0))))
															else temp(4 downto 0);
---------------------------Kolejny poziom drzewa -----------------------------

	temp2(19 downto 15) <= temp1(39 downto 35) when (to_integer(unsigned(temp1 (39 downto 35))) < to_integer(unsigned(temp1(34 downto 30))))
															else temp1(34 downto 30);
	temp2(14 downto 10) <= temp1(29 downto 25) when (to_integer(unsigned(temp1 (29 downto 25))) < to_integer(unsigned(temp1(24 downto 20))))
															else temp1(24 downto 20);
	temp2(9 downto 5) <= temp1(19 downto 15) when (to_integer(unsigned(temp1 (19 downto 15))) < to_integer(unsigned(temp1(14 downto 10))))
															else temp1(14 downto 10);
	temp2(4 downto 0) <= temp1(9 downto 5) when (to_integer(unsigned(temp1 (9 downto 5))) < to_integer(unsigned(temp1(4 downto 0))))
															else temp1(4 downto 0);
															
---------------------------Kolejny poziom drzewa -----------------------------

	temp3(9 downto 5) <= temp2(19 downto 15) when (to_integer(unsigned(temp2(19 downto 15))) < to_integer(unsigned(temp2(14 downto 10))))
														  else temp2(14 downto 10);
	temp3(4 downto 0) <= temp2(9 downto 5) when (to_integer(unsigned(temp2(9 downto 5))) < to_integer(unsigned(temp2(4 downto 0))))
														  else temp2(4 downto 0);
---------------------------Korzeń drzewa, czyli wyjscie -----------------------

	output <= temp3(9 downto 5) when (to_integer(unsigned(temp3(9 downto 5))) < to_integer(unsigned(temp3(4 downto 0))))
										 else temp3(4 downto 0);
--																
																
																
end beh;