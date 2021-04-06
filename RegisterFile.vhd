library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity RegisterFile is
	Port(WriteReg,ReadReg1,ReadReg2: in std_logic_vector(4 downto 0):="00000";
		  RegWrite,CLK: in std_logic:='0';
		  WriteData: in std_logic_vector(31 downto 0):= (others => '0');
		  ReadData1, ReadData2: out std_logic_vector(31 downto 0):= (others => '0')
		  );
end RegisterFile;

architecture Behavioral of RegisterFile is

component Mux32x1 IS
	PORT (sel: in std_logic_vector(4 downto 0);
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
END component;

Component Decoder5x32 is
	Port( WriteReg: in std_logic_vector(4 downto 0);
			RegWrite: in std_logic;
			Enablers: out std_logic_vector(31 downto 0)
		  );
END Component;

Component Reg is
	Port(CLK: in std_logic:='0';
		  Enables,WriteData: in std_logic_vector(31 downto 0);
		  f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,f13,f14,f15,f16,f17,f18,f19,f20,f21,f22,f23,f24,f25,f26,f27,f28,f29,f30,f31: out std_logic_vector(31 downto 0)
		  );
end Component;

signal ens: std_logic_vector(31 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,R32: std_logic_vector(31 downto 0);
begin
DC: Decoder5x32 port map(WriteReg, RegWrite,Ens);
M1: Mux32x1 port map(ReadReg1,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,ReadData1);
M2: Mux32x1 port map(ReadReg2,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31,ReadData2);
RO: Reg port map(CLK,ens,WriteData,R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15,R16,R17,R18,R19,R20,R21,R22,R23,R24,R25,R26,R27,R28,R29,R30,R31);
end Behavioral;

