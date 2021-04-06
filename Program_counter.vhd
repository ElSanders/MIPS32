library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_counter is
	Port (D: in STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
			Q: out STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
			RESET: in STD_LOGIC:='0';
			CLK: in STD_LOGIC:='0');
end Program_counter;


architecture Behavioral of Program_counter is
begin
process(CLK, RESET)begin 
	if(RESET='1') then
		Q<="00000000000000000000000000000000";
	elsif(CLK='0' AND CLK'EVENT) then
		Q<=D;
	else null;
	end if;
end process;

end Behavioral;

