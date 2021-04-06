library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ALUControl is
Port(Instruc: in std_logic_vector(5 downto 0);
	  ALUOp: in std_logic_vector(2 downto 0);
	  ALUCtr: out std_logic_vector(2 downto 0);
	  jr: out std_logic
	  );
end ALUControl;

architecture Behavioral of ALUControl is

begin 
ALUCtr <= "000" when ALUOp = "001" and Instruc = "100100" else -- And
			 "001" when ALUOp = "011" --OR para ORi
						or (ALUOp = "001" and Instruc = "100101") else-- OR para OR
			 "010" when ALUOp = "000" -- Jr
						or (ALUOp = "001" and Instruc = "100000") else-- Add
			 "100" when ALUOp = "100" else 
			 "101" when (ALUOp = "001" and Instruc = "001000") --Jr
						or (ALUOp = "001" and Instruc = "000000") else-- Null
			 "110" when ALUOp = "010" --beq
						or (ALUOp = "001" and Instruc = "100010") else--sub
			 "111" when (ALUOp = "001" and Instruc = "101010");--slt
jr<= '1' when ALUOp = "001" and Instruc ="001000" else '0' 
;

end Behavioral;