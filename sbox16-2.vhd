library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sbox16_2 is
	port( din  : in  std_logic_vector(0 to 47); --32asl--16W2
			dout : out std_logic_vector(0 to 55)  --16asl--24W4--16W5
	); 
end entity sbox16_2;

architecture arch16 of sbox16_2 is

  -----------------------------------------------------------------------------
  -- Type definitions
  -----------------------------------------------------------------------------
  subtype ByteInt is integer range 0 to 31;
  type ByteArray is array (0 to 31) of ByteInt;

  -----------------------------------------------------------------------------
  -- Constants
  -----------------------------------------------------------------------------
  constant SBOX : ByteArray := (
	 16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,
	 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);

begin  -- architecture Lut

  -----------------------------------------------------------------------------
  -- Output assignments
  -----------------------------------------------------------------------------
G_p2:
for I in 0 to 31 generate
  dout(i) <= din(sbox(i));
end generate G_p2;

end architecture arch16;