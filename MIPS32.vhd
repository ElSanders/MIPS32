library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPS32 is
Port(CLK_i: in std_logic:='1';
	  Reset_i: in std_logic:='0';
	  p_writeData,p_pc,p_instruction,p_ALURES,p_ALUA,p_ALUB: out std_logic_vector(31 downto 0);
	  p_RegDest,p_Jump,p_Branch,p_MemRead,p_MemtoReg,p_MemWrite,p_ALUsrc,p_RegWrite: out std_logic
	  );
end MIPS32;

architecture Behavioral of MIPS32 is

-- Components

Component Mux321x1 is
		Port(sel: in std_logic;
			  A: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			  B: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			  C: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
			  );
END Component;

Component ALUControl is
Port(Instruc: in std_logic_vector(5 downto 0);
	  ALUOp: in std_logic_vector(2 downto 0);
	  ALUCtr: out std_logic_vector(2 downto 0);
	  jr: out std_logic
	  );
END Component;

Component ShiftLeft2628 is
	PORT( A: in std_logic_VECTOR(25 downto 0):="00000000000000000000000000";
			B: out std_logic_VECTOR(27 downto 0):="0000000000000000000000000000"
			);
END Component;

Component ShiftLeft3232 is
	PORT( A: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
			B: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
			);
END Component;

Component SignExtender is 
Port(A: in std_logic_vector(15 downto 0):="0000000000000000";
	  B: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
	  );
END Component;	  

Component ALU is
Port(A: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
	  B: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
	  Cntrl: in std_logic_vector(2 downto 0):="000";
	  zero: out std_logic:='0';
	  Res: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
			  );
END Component;


Component Adder is
PORT( A: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
			B: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
			C: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
			);
END Component;

Component ControlUnit is
Port(OpCode: in std_logic_vector(5 downto 0);
	  ALUOp: out std_logic_vector(2 downto 0);
	  RegDest,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUsrc,RegWrite: out std_logic
	  );
END Component;

Component DataMemory is
Port( CLK, WRITE_ENABLE, READ_ENABLE: in STD_LOGIC := '0';
			ENABLE: in STD_LOGIC :='0';
			RW_ADDRESS,WRITE_DATA: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
		   READ_DATA: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
		  );
END Component;

Component InstructionMemory is
	Port( READ_ADDRESS: in STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000";
		   INSTRUCTION: out STD_LOGIC_VECTOR(31 downto 0):="00000000000000000000000000000000"
		  );
END Component;

Component Mux5 is
		Port(sel: in std_logic;
			  A: in std_logic_vector(4 downto 0):="00000";
			  B: in std_logic_vector(4 downto 0):="00000";
			  C: out std_logic_vector(4 downto 0):="00000"
			  );
END Component;

Component Program_counter is 
	Port (D: in STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
			Q: out STD_LOGIC_VECTOR (31 downto 0):="00000000000000000000000000000000";
			RESET: in STD_LOGIC:='0';
			CLK: in STD_LOGIC:='0');
END Component;

Component RegisterFile is
	Port(WriteReg,ReadReg1,ReadReg2: in std_logic_vector(4 downto 0):="00000";
		  RegWrite,CLK: in std_logic:='0';
		  WriteData: in std_logic_vector(31 downto 0):= (others => '0');
		  ReadData1, ReadData2: out std_logic_vector(31 downto 0):= (others => '0')
		  );
END Component;

-- Signals
-- For Instruction memory
signal inst : std_logic_vector(31 downto 0);
signal rd_add: std_logic_vector(31 downto 0);
-- For ALU Control
-- Inst(5 downto 0)
signal ALU_Op: std_logic_vector(2 downto 0);
signal ALU_Ctr: std_logic_vector(2 downto 0);
signal jr_i: std_logic;
-- For Porgram Counter
signal PC_in: STD_LOGIC_VECTOR (31 downto 0);
--D / rd_add
--Reset
--CLK
-- For Mux5 @ Register File
-- regdest_i
--RegDest_i
-- inst(15 downto 11) A/1
-- inst(20 downto 16) B/0
signal WriteReg_i: std_logic_vector(4 downto 0);

--For Control Unit
--Inst(31 downto 26)
--ALU_Op
signal RegDest_i: std_logic;
signal Jump_i: std_logic;
signal Branch_i: std_logic;
signal MemRead_i: std_logic;
signal MemtoReg_i: std_logic;
signal MemWrite_i: std_logic;
signal ALUsrc_i: std_logic;
signal RegWrite_i: std_logic;

--For Adder +4
--rd_add
--"0100"
signal PCPlus4: std_logic_vector(31 downto 0);

--For Sign Extender
--Inst(15 downto 0)
signal SE_Bi: std_logic_vector(31 downto 0);
	  
--For Register File
--WriteReg_i
--Ins(25 downto 21)
--Inst(20 downto 16)
--RegWrite_i
--CLK
signal WriteData_i: std_logic_vector(31 downto 0);
signal ReadData1_i: std_logic_vector(31 downto 0);
signal ReadData2_i: std_logic_vector(31 downto 0);

--For Shift Left 26 - 28
--Inst(25 downto 0)
signal JumpAddress: std_logic_vector(31 downto 0); --(27 downto 0)
-- 31 downto 28 <= PCPlus4(31 downto 28)

--For Shift Left 32 - 32 
-- SE_Bi
signal SL32_Bi: std_logic_vector(31 downto 0);

--For Adder SignExtender + PC+4
--PCPlus 4
--SL32_Bi
signal Result : std_logic_vector(31 downto 0);

-- For Mux322x1 RF
--ALUSrc_i
--SL32_Bi
--ReadData2_i
--ALUB_i

-- For ALU
--ReadData1_i
signal ALUB_i: std_logic_vector(31 downto 0);
--ALU_Ctr
signal zero_i: std_logic;
signal ALURes_i: std_logic_vector(31 downto 0);

-- For Data Memory
--CLK
--MemWrite_i
--MemRead_i
-- '1'
--ALURes_i
--ReadData2_i
signal MemData_Out: STD_LOGIC_VECTOR(31 downto 0);
signal Mux1Out: Std_logic_vector(31 downto 0);
signal Mux2Out: Std_logic_vector(31 downto 0);
signal Mux3Out: Std_logic_vector(31 downto 0);
signal BranchAndZero : std_logic;

begin
p_writeData<=WriteData_i;
p_instruction<=inst;
p_pc<=rd_add;

p_RegDest<=RegDest_i;
p_Jump<=Jump_i;
p_Branch<=Branch_i;
p_MemRead<=MemRead_i;
p_MemtoReg<=MemtoReg_i;
p_MemWrite<=MemWrite_i;
p_ALUsrc<=ALUsrc_i;
p_RegWrite<=RegWrite_i;
p_ALURES<=ALURes_i;

p_ALUA<=ReadData1_i;
p_ALUB<=ALUB_i;

BranchAndZero <= Branch_i and zero_i;
-- Maps
IM: InstructionMemory port map(rd_add,inst); 
ALC: ALUControl port map(inst(5 downto 0),ALU_Op,ALU_Ctr,jr_i);
PrC: Program_counter port map(PC_in,rd_add,Reset_i,CLK_i);
M5RF: Mux5 port map(regdest_i,inst(15 downto 11),inst(20 downto 16),WriteReg_i);
CUi: ControlUnit port map(inst(31 downto 26),ALU_Op,RegDest_i,Jump_i,Branch_i,MemRead_i,MemtoReg_i,MemWrite_i,ALUsrc_i,RegWrite_i);
ADD4: Adder port map(rd_add,"00000000000000000000000000000100",PCPlus4); 
SE: SignExtender port map (inst(15 downto 0),SE_Bi);
RF: RegisterFile port map(WriteReg_i,Inst(25 downto 21),Inst(20 downto 16), RegWrite_i,CLK_i,WriteData_i,ReadData1_i,ReadData2_i);
SL26: ShiftLeft2628 port map(inst(25 downto 0), JumpAddress(27 downto 0));
SL32: ShiftLeft3232 port map(SE_Bi,SL32_Bi);
ADDS: Adder port map(PCPlus4,SL32_Bi,Result);
M32: Mux321x1 port map(ALUSrc_i,SE_Bi,ReadData2_i,ALUB_i);
ALUi: ALU port map(ReadData1_i,ALUB_i,ALU_Ctr,zero_i,ALURes_i);
DM: DataMemory port map(CLK_i,MemWrite_i,MemRead_i,'1',ALURes_i,ReadData2_i,MemData_Out);
JumpAddress(31 downto 28)<= PCPlus4(31 downto 28);
MuxDataMemory: Mux321x1 port map(MemtoReg_i,MemData_Out,ALURes_i,WriteData_i);
Mux1:Mux321x1 port map(BranchAndZero,Result,PCPlus4,Mux1Out);
Mux2:Mux321x1 port map(jump_i,JumpAddress,Mux1Out,Mux2Out);
Mux3:Mux321x1 port map(jr_i,ReadData2_i,Mux2Out,PC_In);
end Behavioral;

