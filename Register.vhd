library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Reg is
	Port(CLK: in std_logic:='0';
		  Enables,WriteData: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
		  f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23,f24,f25,f26,f27,f28,f29,f30,f31: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
		  );
end Reg;

architecture Behavioral of Reg is

begin
PROCESS (Enables,CLK)
	SUBTYPE REGISTRO IS STD_LOGIC_VECTOR (31 DOWNTO 0);
		TYPE REG_BANK IS ARRAY (0 TO 31) OF REGISTRO;
		VARIABLE REG_MEMORY: REG_BANK := (
													X"00000000",
													X"00000000",
													X"00000000",
													X"00000000",
													OTHERS => (OTHERS => '0')
		 );
	BEGIN
	 --<< cuerpo del process >>
	 IF(CLK='0' and CLK'EVENT) THEN
		 f0<=REG_MEMORY(0);
		 f1<=REG_MEMORY(1);
		 f2<=REG_MEMORY(2);
		 f3<=REG_MEMORY(3);
		 f4<=REG_MEMORY(4);
		 f5<=REG_MEMORY(5);
		 f6<=REG_MEMORY(6);
		 f7<=REG_MEMORY(7);
		 f8<=REG_MEMORY(8);
		 f9<=REG_MEMORY(9);
		 f10<=REG_MEMORY(10);
		 f11<=REG_MEMORY(11);
		 f12<=REG_MEMORY(12);
		 f13<=REG_MEMORY(13);
		 f14<=REG_MEMORY(14);
		 f15<=REG_MEMORY(15);
		 f16<=REG_MEMORY(16);
		 f17<=REG_MEMORY(17);
		 f18<=REG_MEMORY(18);
		 f19<=REG_MEMORY(19);
		 f20<=REG_MEMORY(20);
		 f21<=REG_MEMORY(21);
		 f22<=REG_MEMORY(22);
		 f23<=REG_MEMORY(23);
		 f24<=REG_MEMORY(24);
		 f25<=REG_MEMORY(25);
		 f26<=REG_MEMORY(26);
		 f27<=REG_MEMORY(27);
		 f28<=REG_MEMORY(28);
		 f29<=REG_MEMORY(29);
		 f30<=REG_MEMORY(30);
		 f31<=REG_MEMORY(31);
		 IF Enables = "00000000000000000000000000000001" THEN
		 null;
		 ELSIF Enables = "00000000000000000000000000000010" THEN
		 REG_MEMORY(1):=WriteData;
		 ELSIF Enables = "00000000000000000000000000000100" THEN
		 REG_MEMORY(2):=WriteData;
		 ELSIF Enables = "00000000000000000000000000001000" THEN
		 REG_MEMORY(3):=WriteData;
		 ELSIF Enables = "00000000000000000000000000010000" THEN
		 REG_MEMORY(4):=WriteData;
		 ELSIF Enables = "00000000000000000000000000100000" THEN
		 REG_MEMORY(5):=WriteData;
		 ELSIF Enables = "00000000000000000000000001000000" THEN
		 REG_MEMORY(6):=WriteData;
		 ELSIF Enables = "00000000000000000000000010000000" THEN
		 REG_MEMORY(7):=WriteData;
		 ELSIF Enables = "00000000000000000000000100000000" THEN
		 REG_MEMORY(8):=WriteData;
		 ELSIF Enables = "00000000000000000000001000000000" THEN
		 REG_MEMORY(9):=WriteData;
		 ELSIF Enables = "00000000000000000000010000000000" THEN
		 REG_MEMORY(10):=WriteData;
		 ELSIF Enables = "00000000000000000000100000000000" THEN
		 REG_MEMORY(11):=WriteData;
		 ELSIF Enables = "00000000000000000001000000000000" THEN
		 REG_MEMORY(12):=WriteData;
		 ELSIF Enables = "00000000000000000010000000000000" THEN
		 REG_MEMORY(13):=WriteData;
		 ELSIF Enables = "00000000000000000100000000000000" THEN
		 REG_MEMORY(14):=WriteData;
		 ELSIF Enables = "00000000000000001000000000000000" THEN
		 REG_MEMORY(15):=WriteData;
		 ELSIF Enables = "00000000000000010000000000000000" THEN
		 REG_MEMORY(16):=WriteData;
		 ELSIF Enables = "00000000000000100000000000000000" THEN
		 REG_MEMORY(17):=WriteData;
		 ELSIF Enables = "00000000000001000000000000000000" THEN
		 REG_MEMORY(18):=WriteData;
		 ELSIF Enables = "00000000000010000000000000000000" THEN
		 REG_MEMORY(19):=WriteData;
		 ELSIF Enables = "00000000000100000000000000000000" THEN
		 REG_MEMORY(20):=WriteData;
		 ELSIF Enables = "00000000001000000000000000000000" THEN
		 REG_MEMORY(21):=WriteData;
		 ELSIF Enables = "00000000010000000000000000000000" THEN
		 REG_MEMORY(22):=WriteData;
		 ELSIF Enables = "00000000100000000000000000000000" THEN
		 REG_MEMORY(23):=WriteData;
		 ELSIF Enables = "00000001000000000000000000000000" THEN
		 REG_MEMORY(24):=WriteData;
		 ELSIF Enables = "00000010000000000000000000000000" THEN
		 REG_MEMORY(25):=WriteData;
		 ELSIF Enables = "00000100000000000000000000000000" THEN
		 REG_MEMORY(26):=WriteData;
		 ELSIF Enables = "00001000000000000000000000000000" THEN
		 REG_MEMORY(27):=WriteData;
		 ELSIF Enables = "00010000000000000000000000000000" THEN
		 REG_MEMORY(28):=WriteData;
		 ELSIF Enables = "00100000000000000000000000000000" THEN
		 REG_MEMORY(29):=WriteData;
		 ELSIF Enables = "01000000000000000000000000000000" THEN
		 REG_MEMORY(30):=WriteData;
		 ELSIF Enables = "10000000000000000000000000000000" THEN
		 REG_MEMORY(31):=WriteData;
		 ELSE NULL;
		 END IF;
	 ELSE NULL;
	 END IF;
END PROCESS;

end Behavioral;

