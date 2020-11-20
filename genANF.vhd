library ieee;
use ieee.std_logic_1164.all;
library five;
library six;

entity genANF is 
	generic (N: integer := 4);
port(
							clk: in std_logic;
							reset: in std_logic;
							ANF: out std_logic_vector((2 ** N) - 1 downto 0)
							);
end genANF;

architecture behavioral of genANF is
	signal nh: std_logic_vector(5 downto 0);
	signal nl: std_logic_vector(4 downto 0);
begin

	nless: entity five.five_bit_counter 
	port map(clk, reset, nl);

	nhalf: entity six.six_bit_counter
	port map(clk, reset, nh);

	ANF(0) <= nl(0);
	ANF(1) <= nl(1);
	ANF(2) <= nl(2);
	ANF(3) <= nh(0);
	ANF(4) <= nl(3);
	ANF(5) <= nh(1);
	ANF(6) <= nh(2);
	ANF(7) <= '0';
	ANF(8) <= nl(4);
	ANF(9) <= nh(3);
	ANF(10) <= nh(4);
	ANF(11) <= '0';
	ANF(12) <= '0';
	ANF(13) <= '0';
	ANF(14) <= '0';
	ANF(15) <= '0';

end behavioral;