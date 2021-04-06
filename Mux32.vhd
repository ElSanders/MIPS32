library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Mux32x1 is
		Port(sel: in std_logic_vector(4 downto 0);
			  I1: in std_logic_vector(31 downto 0);
			  I2: in std_logic_vector(31 downto 0);
			  I3: in std_logic_vector(31 downto 0);
			  I4: in std_logic_vector(31 downto 0);
			  I5: in std_logic_vector(31 downto 0);
			  I6: in std_logic_vector(31 downto 0);
			  I7: in std_logic_vector(31 downto 0);
			  I8: in std_logic_vector(31 downto 0);
			  I9: in std_logic_vector(31 downto 0);
			  I10: in std_logic_vector(31 downto 0);
			  I11: in std_logic_vector(31 downto 0);
			  I12: in std_logic_vector(31 downto 0);
			  I13: in std_logic_vector(31 downto 0);
			  I14: in std_logic_vector(31 downto 0);
			  I15: in std_logic_vector(31 downto 0);
			  I16: in std_logic_vector(31 downto 0);
			  I17: in std_logic_vector(31 downto 0);
			  I18: in std_logic_vector(31 downto 0);
			  I19: in std_logic_vector(31 downto 0);
			  I20: in std_logic_vector(31 downto 0);
			  I21: in std_logic_vector(31 downto 0);
			  I22: in std_logic_vector(31 downto 0);
			  I23: in std_logic_vector(31 downto 0);
			  I24: in std_logic_vector(31 downto 0);
			  I25: in std_logic_vector(31 downto 0);
			  I26: in std_logic_vector(31 downto 0);
			  I27: in std_logic_vector(31 downto 0);
			  I28: in std_logic_vector(31 downto 0);
			  I29: in std_logic_vector(31 downto 0);
			  I30: in std_logic_vector(31 downto 0);
			  I31: in std_logic_vector(31 downto 0);
			  I32: in std_logic_vector(31 downto 0);
			  C: out std_logic_vector(31 downto 0):= (others => '0')
			  );
end Mux32x1;

architecture Behavioral of Mux32x1 is

begin
C<=I1 when sel = "00000" else
	I2 when sel = "00001" else
	I3 when sel = "00010" else
	I4 when sel = "00011" else
	I5 when sel = "00100" else
	I6 when sel = "00101" else
	I7 when sel = "00110" else
	I8 when sel = "00111" else
	I9 when sel = "01000" else
	I10 when sel = "01001" else
	I11 when sel = "01010" else
	I12 when sel = "01011" else
	I13 when sel = "01100" else
	I14 when sel = "01101" else
	I15 when sel = "01110" else
	I16 when sel = "01111" else
	I17 when sel = "10000" else
	I18 when sel = "10001" else
	I19 when sel = "10010" else
	I20 when sel = "10011" else
	I21 when sel = "10100" else
	I22 when sel = "10101" else
	I23 when sel = "10110" else
	I24 when sel = "10111" else
	I25 when sel = "11000" else
	I26 when sel = "11001" else
	I27 when sel = "11010" else
	I28 when sel = "11011" else
	I29 when sel = "11100" else
	I30 when sel = "11101" else
	I31 when sel = "11110" else
	I32 when sel = "11111";

end Behavioral;

