library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SignExtender is
	Port(A: in std_logic_vector(15 downto 0):="0000000000000000";
		  B: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
		  );
end SignExtender;

architecture Behavioral of SignExtender is

begin
B(15 downto 0)<= A;
B(31)<=A(15);
B(30)<=A(15);
B(29)<=A(15);
B(28)<=A(15);
B(27)<=A(15);
B(26)<=A(15);
B(25)<=A(15);
B(24)<=A(15);
B(23)<=A(15);
B(22)<=A(15);
B(21)<=A(15);
B(20)<=A(15);
B(19)<=A(15);
B(18)<=A(15);
B(17)<=A(15);
B(16)<=A(15);

end Behavioral;

