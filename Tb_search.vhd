LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;


ENTITY search_vhd_vec_tst IS
END search_vhd_vec_tst;
ARCHITECTURE search_arch OF search_vhd_vec_tst IS
-- constants                                                 
-- signals       
                                            
	SIGNAL clk : STD_LOGIC;
	SIGNAL output : STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	file file_results : text;
	
	
	
	COMPONENT search
		PORT (
		clk : IN STD_LOGIC;
		output : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
	END COMPONENT;

BEGIN
	i1 : search
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	output => output
	);

	process()
	variable current_line: line;
	
	BEGIN
--		file_open(file_results, "output_results.txt", write_mode);
		LOOP
			clk <= '0';	
			
	
			write(current_line, string'("Kolejna funkcja bent: "));
			write(current_line, output);
			writeline(file_results, current_line);
			clk <= '1';
			if (now >= 1000000 ps) then
				exit;
			end if;
										
		END LOOP;
	END PROCESS;
END search_arch;


