library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity full_adder is
  port (
    a  : in std_logic;
    b  : in std_logic;
    cin : in std_logic;
    --
    sum  : out std_logic;
    cout : out std_logic
    );
end full_adder;
 
 
architecture rtl of full_adder is
 
  signal w_WIRE_1 : std_logic;
  signal w_WIRE_2 : std_logic;
  signal w_WIRE_3 : std_logic;
   
begin
 
  w_WIRE_1 <= a xor b;
  w_WIRE_2 <= w_WIRE_1 and cin;
  w_WIRE_3 <= a and b;
 
  sum   <= w_WIRE_1 xor cin;
  cout <= w_WIRE_2 or w_WIRE_3;
 
end rtl;