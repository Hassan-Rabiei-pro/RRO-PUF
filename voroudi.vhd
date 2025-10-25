library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity input is
		port( en : in STD_LOGIC;
				clk : in STD_LOGIC;
				t_valid : in STD_LOGIC;
				cin: out STD_LOGIC_VECTOR(7 downto 0);
				t_validq_d : out STD_LOGIC
		);

end input;

architecture Behavioral of input is
signal cins: STD_LOGIC_VECTOR(7 downto 0);
signal t_validq_s: STD_LOGIC;

begin

process(clk,t_valid)
	begin
		t_validq_s <=t_valid;
		t_validq_d <=t_validq_s;
				 
		if (en = '0' ) then
			cins <= "11111111";
		else
			if rising_edge(t_valid) then
				cins <= cins + 1;
			end if;
		end if;
		cin <= cins;
end process;

end Behavioral;

