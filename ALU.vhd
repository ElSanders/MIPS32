library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALU is
		Port(A: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			  B: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			  Cntrl: in std_logic_vector(2 downto 0):="000";
			  zero: out std_logic:='0';
			  Res: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
			  );
end ALU;

architecture Behavioral of ALU is
signal resSignal: std_logic_vector(31 downto 0); 
begin
zero<='1' when resSignal="00000000000000000000000000000000" else '0';
Res<=resSignal;
Process(Cntrl,a,b) begin
if(Cntrl = "000") then
resSignal<= A and B;
elsif(Cntrl = "001") then
resSignal<= A or B;
elsif(Cntrl = "010") then
resSignal<= A+B;
elsif(Cntrl = "011") then
resSignal<=A;
elsif(Cntrl = "100") then
resSignal(31 downto 16)<=B(15 downto 0);
resSignal(15 downto 0)<="0000000000000000";
elsif(Cntrl = "101") then
null;
elsif(Cntrl = "110") then
resSignal<=A-B;
elsif(Cntrl = "111") then
	if(a>=b)then
	resSignal<="00000000000000000000000000000000";
	else
	resSignal<="00000000000000000000000000000001";
	end if;
end if;
end process;


end Behavioral;

