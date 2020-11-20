library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity five_bit_counter is
	port(	clk: in std_logic;
			reset: in std_logic;
			counter: out std_logic_vector(4 downto 0)
		 );
	end five_bit_counter;
	
architecture behavioral of five_bit_counter is
signal counter_up: std_logic_vector(4 downto 0);

begin
	
	process(clk, reset)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				counter_up <= "00000";
		else
			counter_up <= counter_up + x"1";
			end if;
		end if;
	end process;
		counter <= counter_up;

end behavioral;