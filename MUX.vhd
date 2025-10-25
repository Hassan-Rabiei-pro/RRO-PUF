library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

ENTITY mux IS
	GENERIC(N : INTEGER :=8; S : INTEGER :=3);
	PORT( Sel : IN STD_LOGIC_Vector(S-1 downto 0);
			din : IN STD_LOGIC_Vector(0 to n-1);
			dout : OUT STD_LOGIC
	);
END mux;

ARCHITECTURE archmux OF mux IS
BEGIN

dout <= din(conv_integer(sel));

END archmux;