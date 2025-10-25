library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_COMPARE is
	GENERIC (m : INTEGER :=14; s : INTEGER :=3);
	port(
			clk : in STD_LOGIC;
			A, B : in STD_LOGIC_VECTOR(m-1 downto 0);
			t_valid : out STD_LOGIC;
			rsp_key: out STD_LOGIC;
			rsp : out std_logic
	);
end my_COMPARE;

architecture arch_comp of my_COMPARE is
signal t_valid_s: STD_LOGIC;
signal t_valid_sd: STD_LOGIC;

begin

process(clk,a,b)
	begin
	if rising_edge(clk) then
		t_valid_s <= '0';	
		if (a > 1000 and b>1000) then 
			if (a > b) then
				rsp <= '1';
			else
				rsp <= '0';
			end if;
			---------------------------------------------------------
			if ((a>b and (a-b > 85)) or (b>a and (b-a > 85))) then
			rsp_key <= '1';
			else
			rsp_key <= '0';
			end if;
			---------------------------------------------------------	
			t_valid_s <= '1';
		end if;
		t_valid_sd <= t_valid_s;
		t_valid <= t_valid_s and not(t_valid_sd);
	end if;	
	
end process;

end arch_comp;