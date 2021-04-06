library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShiftLeft2628 is
	PORT( A: in std_logic_VECTOR(25 downto 0):="00000000000000000000000000";
			B: out std_logic_VECTOR(27 downto 0):="0000000000000000000000000000"
			);
end ShiftLeft2628;

architecture Behavioral of ShiftLeft2628 is

begin
B(27 downto 2)<=A;
B(1 downto 0)<="00";

end Behavioral;

