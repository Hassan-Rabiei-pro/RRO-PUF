library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sbox16_1 is
	port( din  : in  std_logic_vector(0 to 71); -- 32Asl-16W1-24W4
			dout : out std_logic_vector(0 to 71)  -- 32asl-16W2-24W3
	); 
end entity sbox16_1;

architecture arch16 of sbox16_1 is

  -----------------------------------------------------------------------------
  -- Type definitions
  -----------------------------------------------------------------------------
  subtype ByteInt is integer range 0 to 63;
  type ByteArray is array (0 to 63) of ByteInt;

  -----------------------------------------------------------------------------
  -- Constants
  -----------------------------------------------------------------------------
  constant SBOX : ByteArray := (
    	16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,
		32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,
		0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

begin  -- architecture Lut

  -----------------------------------------------------------------------------
  -- Output assignments
  -----------------------------------------------------------------------------
G_p1:
for I in 0 to 63  generate
  dout(i) <= din(sbox(i));  
end generate G_p1;

end architecture arch16;
