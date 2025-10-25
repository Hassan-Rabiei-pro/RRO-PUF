library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inverse is
    Port( i1 : in  STD_LOGIC;
          o1 : out STD_LOGIC);
end inverse;

architecture archinv of inverse is

begin
	o1 <= not i1;

end archinv;
