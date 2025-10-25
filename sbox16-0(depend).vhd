library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sbox16_0 is
	port( din  : in  std_logic_vector(0 to 55); -- 16Asl-24W3-16W5
			dout : out std_logic_vector(0 to 47)  -- 32asl-16W1
	); 
end entity sbox16_0;

architecture arch16 of sbox16_0 is

  -----------------------------------------------------------------------------
  -- Type definitions
  -----------------------------------------------------------------------------
  subtype ByteInt is integer range 0 to 31;
  type ByteArray is array (0 to 31) of ByteInt;

  -----------------------------------------------------------------------------
  -- Constants
  -----------------------------------------------------------------------------
  constant SBOX : ByteArray := (
		0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31);

begin  -- architecture Lut

  -----------------------------------------------------------------------------
  -- Output assignments
  -----------------------------------------------------------------------------
G_p0:
for I in 0 to 31 generate
  dout(i) <= din(sbox(i));
end generate G_p0;

end architecture arch16;