library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder is
	PORT( A: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
			B: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
			C: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
			);
end Adder;

architecture Behavioral of Adder is

begin
C<=A + B;

end Behavioral;

