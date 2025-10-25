library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ande is
  port(i1 : in std_logic; i2 : in std_logic; o1: out std_logic);
 end ande;

architecture arch of ande is 
begin
  o1<= i1 and i2;
end arch;