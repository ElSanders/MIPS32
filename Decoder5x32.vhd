library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Decoder5x32 is
	Port( WriteReg: in std_logic_vector(4 downto 0);
			RegWrite: in std_logic;
			Enablers: out std_logic_vector(31 downto 0)
		  );
end Decoder5x32;

architecture Behavioral of Decoder5x32 is

begin
Enablers <= 
	"00000000000000000000000000000000" when RegWrite = '0' else
	"00000000000000000000000000000001" when RegWrite = '1' and WriteReg = "00000" else
	"00000000000000000000000000000010" when RegWrite = '1' and WriteReg = "00001" else	
	"00000000000000000000000000000100" when RegWrite = '1' and WriteReg = "00010" else
	"00000000000000000000000000001000" when RegWrite = '1' and WriteReg = "00011" else
	"00000000000000000000000000010000" when RegWrite = '1' and WriteReg = "00100" else
	"00000000000000000000000000100000" when RegWrite = '1' and WriteReg = "00101" else
	"00000000000000000000000001000000" when RegWrite = '1' and WriteReg = "00110" else
	"00000000000000000000000010000000" when RegWrite = '1' and WriteReg = "00111" else
	"00000000000000000000000100000000" when RegWrite = '1' and WriteReg = "01000" else
	"00000000000000000000001000000000" when RegWrite = '1' and WriteReg = "01001" else
	"00000000000000000000010000000000" when RegWrite = '1' and WriteReg = "01010" else
	"00000000000000000000100000000000" when RegWrite = '1' and WriteReg = "01011" else
	"00000000000000000001000000000000" when RegWrite = '1' and WriteReg = "01100" else
	"00000000000000000010000000000000" when RegWrite = '1' and WriteReg = "01101" else
	"00000000000000000100000000000000" when RegWrite = '1' and WriteReg = "01110" else
	"00000000000000001000000000000000" when RegWrite = '1' and WriteReg = "01111" else
	"00000000000000010000000000000000" when RegWrite = '1' and WriteReg = "10000" else
	"00000000000000100000000000000000" when RegWrite = '1' and WriteReg = "10001" else
	"00000000000001000000000000000000" when RegWrite = '1' and WriteReg = "10010" else
	"00000000000010000000000000000000" when RegWrite = '1' and WriteReg = "10011" else
	"00000000000100000000000000000000" when RegWrite = '1' and WriteReg = "10100" else
	"00000000001000000000000000000000" when RegWrite = '1' and WriteReg = "10101" else
	"00000000010000000000000000000000" when RegWrite = '1' and WriteReg = "10110" else
	"00000000100000000000000000000000" when RegWrite = '1' and WriteReg = "10111" else
	"00000001000000000000000000000000" when RegWrite = '1' and WriteReg = "11000" else
	"00000010000000000000000000000000" when RegWrite = '1' and WriteReg = "11001" else
	"00000100000000000000000000000000" when RegWrite = '1' and WriteReg = "11010" else
	"00001000000000000000000000000000" when RegWrite = '1' and WriteReg = "11011" else
	"00010000000000000000000000000000" when RegWrite = '1' and WriteReg = "11100" else
	"00100000000000000000000000000000" when RegWrite = '1' and WriteReg = "11101" else
	"01000000000000000000000000000000" when RegWrite = '1' and WriteReg = "11110" else
	"10000000000000000000000000000000" when RegWrite = '1' and WriteReg = "11111" else "00000000000000000000000000000000";

end Behavioral;

