library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShiftLeft3232 is
	PORT( A: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
			B: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
			);
end ShiftLeft3232;

architecture Behavioral of ShiftLeft3232 is

begin

B(31 downto 2)<=A(29 downto 0);
B(1 downto 0)<="00";

end Behavioral;

