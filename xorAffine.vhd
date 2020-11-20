library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library ham;
use ham.hamming.all;

entity xorAffine is 
	generic(N: integer := 4);
	port(input: in std_logic_vector((2 ** N) - 1 downto 0);
			output: out std_logic_vector((2 ** N) - 1 downto 0)
		  );
end xorAffine;

architecture xorAffine of xorAffine is
	subtype four_bits is std_logic_vector(3 downto 0);
	type TruthTable is array((2 ** N + 1) - 1 downto 0) of four_bits;
	constant TT: TruthTable := (x"0000", x"F0F0", x"FF00", x"0FF0",
										 x"FFFF", x"0F0F", x"00FF", x"F00F",
										 x"AAAA", x"5A5A", x"55AA", x"A55A",
										 x"5555", x"A5A5", x"AA55", x"5AA5",
										 x"CCCC", x"3c3c", x"33cc", x"c33c",
										 x"3333", x"c3c3", x"cc33", x"3cc3",
										 x"6666", x"9696", x"9966", x"6996",
										 x"9999", x"6969", x"6699", x"9669");

	signal temp0, temp1, temp2, temp3: std_logic_vector((2 ** N) - 1 downto 0);
	variable bent: std_logic_vector((2 ** N) - 1 downto 0);
	
begin

	p0: process(input)
	begin
		for i in 0 to (TruthTable'length / 4) - 1 loop
			exit when not bent = "0000000000000000";
			check <= input xor TT(i);
			if hamming_weight(check) = 6 and (hamming_weight(input) = 6 or hamming_weight(input) = 10) then 
				bent <= input;
				exit;
			end if;
		end loop;
	end process;

	p1: process(input)
	begin
		for i in TruthTable'length / 4 to (TruthTable'length / 2) -1 loop
			exit when not bent = "0000000000000000";
			check <= input xor TT(i);
			if hamming_weight(check) = 6 and (hamming_weight(input) = 6 or hamming_weight(input) = 10) then 
				bent <= input;
				exit;
			end if;
		end loop;
	end process;

	p2: process(input)
	begin
		for i in TruthTable'length / 2 to (3 * (TruthTable'length / 4)) - 1 loop
			exit when not bent = "0000000000000000";
			check <= input xor TT(i);
			if hamming_weight(check) = 6 and (hamming_weight(input) = 6 or hamming_weight(input) = 10) then 
				bent <= input;
				exit;
			end if;
		end loop;
	end process;
	
	p3: process(input)
	begin
		for i in 3 * (TruthTable'length / 4) to (TruthTable'length) - 1  loop
			exit when not bent = "0000000000000000";
			check <= input xor TT(i);
			if hamming_weight(check) = 6 and (hamming_weight(input) = 6 or hamming_weight(input) = 10)  then 
				bent <= input;
				exit;
			end if;
		end loop;
	end process;
	
end xorAffine;