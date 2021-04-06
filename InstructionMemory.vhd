library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory is
	Port( READ_ADDRESS: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
		   INSTRUCTION: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
		  );
end InstructionMemory;

architecture Behavioral of InstructionMemory is

begin

PROCESS (READ_ADDRESS)
	SUBTYPE REGISTRO IS STD_LOGIC_VECTOR (31 DOWNTO 0);
		TYPE REG_BANK IS ARRAY (0 TO 31) OF REGISTRO;
		VARIABLE INST_MEMORY: REG_BANK := (
													"00000000000000000100000000100000",--and r8,r0,r0
													"10001100000000010000000000000000",--lw r1,0x0(r0)
													"10001100000000100000000000000100",--lw r2, 0x4(r0)
													"10001100000000110000000000001000",--lw r3, 0x8(r0)
													"00000000000000000000000000000000",--nop
													"00000000010000010001100000100000",--add r3,r2,r1
													"00000000010000010010000000100101",--or r4, r2,r1
													"00000000010000010010100000100010",--sub r5,r2,r1
													"00000000010000010011000000100100",-- and r6,r2,r1
													"00001000000000000000000000001110",-- j 0x34 (L1)
													"00100001000010000000000000000001", -- addi r8,r8,0x1
													"00000000000000000000000000000000", --nop
													"00000000000010000011100000101010", -- slt r7,r0,r8
													"00000000000000000000000000000000",--nop
													"00010000111010001111111111111011",--beq r7,r8,L2
													"00111100000010010010000000000000",-- lui r9, 0x2000
													"00000000000000000000000000000000", --nop
													"00110101001010010000000000010100",--ori r9,r9,0x14														
													"00000000000000000000000000000000",--nop
													"10101101001010000000000000000000",--sw r8,0x0,r9
													"00000000000000000000000000000000",--nop
													"10001101001010100000000000000000",--lw r10,0x0,r9													
													"00000000000000000000000000001000",--jr r0
													OTHERS => (OTHERS => '0')
		 );
		 VARIABLE ADDRESS: INTEGER;
	BEGIN
	 --<< cuerpo del process >>
	 ADDRESS:= TO_INTEGER(UNSIGNED(READ_ADDRESS(6 downto 2)));
	 INSTRUCTION <= INST_MEMORY(ADDRESS);
END PROCESS;


end Behavioral;
