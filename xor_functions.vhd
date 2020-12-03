library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity xor_functions is 
	port(
			input: in std_logic_vector(15 downto 0);
			output: out std_logic_vector(511 downto 0)
		 );
end xor_functions;

architecture beh of xor_functions is 
	
	subtype two_bytes is std_logic_vector(15 downto 0);
	type TruthTable is array(31 downto 0) of two_bytes;
	constant TT: TruthTable := (x"0000", x"F0F0", x"FF00", x"0FF0",
										 x"FFFF", x"0F0F", x"00FF", x"F00F",
										 x"AAAA", x"5A5A", x"55AA", x"A55A",
										 x"5555", x"A5A5", x"AA55", x"5AA5",
										 x"CCCC", x"3c3c", x"33cc", x"c33c",
										 x"3333", x"c3c3", x"cc33", x"3cc3",
										 x"6666", x"9696", x"9966", x"6996",
										 x"9999", x"6969", x"6699", x"9669");
	
	
	
begin
	
	output(511 downto 496) <= TT(0) xor input;
	output(495 downto 480) <= TT(1) xor input;
	output(479 downto 464) <= TT(2) xor input;
	output(463 downto 448) <= TT(3) xor input;
	output(447 downto 432) <= TT(4) xor input;
	output(431 downto 416) <= TT(5) xor input;
	output(415 downto 400) <= TT(6) xor input;
	output(399 downto 384) <= TT(7) xor input;
	output(383 downto 368) <= TT(8) xor input;
	output(367 downto 352) <= TT(9) xor input;
	output(351 downto 336) <= TT(10) xor input;
	output(335 downto 320) <= TT(11) xor input;
	output(319 downto 304) <= TT(12) xor input;
	output(303 downto 288) <= TT(13) xor input;
	output(287 downto 272) <= TT(14) xor input;
	output(271 downto 256) <= TT(15) xor input;
	output(255 downto 240) <= TT(16) xor input;
	output(239 downto 224) <= TT(17) xor input;
	output(223 downto 208) <= TT(18) xor input;
	output(207 downto 192) <= TT(19) xor input;
	output(191 downto 176) <= TT(20) xor input;
	output(175 downto 160) <= TT(21) xor input;
	output(159 downto 144) <= TT(22) xor input;
	output(143 downto 128) <= TT(23) xor input;
	output(127 downto 112) <= TT(24) xor input;
	output(111 downto 96) <= TT(25) xor input;
	output(95 downto 80) <= TT(26) xor input;
	output(79 downto 64) <= TT(27) xor input;
	output(63 downto 48) <= TT(28) xor input;
	output(47 downto 32) <= TT(29) xor input;
	output(31 downto 16) <= TT(30) xor input;
	output(15 downto 0) <= TT(31) xor input;

end beh;
