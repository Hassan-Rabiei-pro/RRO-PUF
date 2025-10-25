library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_counter is
	GENERIC(m : INTEGER :=14; s : INTEGER :=3);
	port( enable : in STD_LOGIC;
			reset : in STD_LOGIC;
			Clk : in STD_LOGIC;
			qout :out  STD_LOGIC_VECTOR(m-1 downto 0);
			valid : out STD_LOGIC
	);
	end my_counter;

architecture arch_count of my_counter is

signal r_counter : STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
signal r_valid : STD_LOGIC :='0';
signal counter : STD_LOGIC_VECTOR(m-1 downto 0) := (others => '0');

begin

process (reset,enable) 
begin 
	if (reset = '1' ) then
		r_counter <= (others => '0');
		r_valid <= '0';
	else 
		if (rising_edge(enable)) then 
			r_counter <= r_counter +1 ;
			r_valid <= '0';
		end if;
		if (r_counter > 131070) then
			r_valid <= '1';
			r_counter <= (others => '0');
		end if;
	end if;
end process;

process(clk) 
begin
	if (reset = '1' ) then
		counter <= (others => '0');
		valid <= '0';
	else
		if (rising_edge(r_valid)) then
			counter <= counter +1 ;
			valid <= '0';
		end if;
		if (counter > 16382) then
			valid <= '1';
		end if;
	end if;	
end process;

qout <= counter;

end arch_count;