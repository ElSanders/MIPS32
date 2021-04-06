library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ControlUnit is
Port(OpCode: in std_logic_vector(5 downto 0):="000000";
	  ALUOp: out std_logic_vector(2 downto 0):="000";
	  RegDest,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite: out std_logic:='0'
	  );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
RegDest<= '1' when OpCode = "000000" -- Tipo R
					 or OpCode = "101010" --slt
					 else '0';
Jump<='1' when OpCode="000010"--j
--				or OpCode = "000000" --jr
			 else '0';
Branch<='1' when OpCode="000100"--beq
			   else '0';
MemRead<='1' when OpCode="100011" --lw
			    else '0';
MemtoReg<='1' when OpCode="100011"--lw
			     else '0';
MemWrite<='1' when OpCode="101011"--sw
			     else '0';
ALUsrc<='1' when OpCode="001101" --ori
			   or OpCode="100011" --lw
				or OpCode ="101011"--sw
				or OpCode = "001000"--Addi
				or OpCode = "001111"--lui
			   else '0';
RegWrite<='1' when OpCode = "000000"-- Tipo R
				  or OpCode = "101010" --slt
				  or OpCode="001101" --ori
				  or OpCode="100011" --lw
				  or OpCode = "001000"--Addi
				  or OpCode = "001111"--lui
				  else '0';
ALUOp<="000" when OpCode = "000010" --j (Todos los que requieren suma)
					or OpCode ="001000" --addi
					or OpCode ="100011" --lw
					or OpCode ="101011" --sw
					else
		 "001" when OpCode = "000000" else -- Tipo R
		 "010" when OpCode = "000100" else --beq
		 "011" when OpCode = "001101" else --ori
		 "100" when OpCode = "001111" else --lui
		 "111";-- Todos los otros casos

end Behavioral;

