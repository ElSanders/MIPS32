LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TMIPS IS
END TMIPS;
 
ARCHITECTURE behavior OF TMIPS IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MIPS32
    PORT(
         CLK_i : IN  std_logic;
         Reset_i : IN  std_logic;
         p_writeData : OUT  std_logic_vector(31 downto 0);
         p_pc : OUT  std_logic_vector(31 downto 0);
         p_instruction : OUT  std_logic_vector(31 downto 0);
         p_ALURES : OUT  std_logic_vector(31 downto 0);
         p_ALUA : OUT  std_logic_vector(31 downto 0);
         p_ALUB : OUT  std_logic_vector(31 downto 0);
         p_RegDest : OUT  std_logic;
         p_Jump : OUT  std_logic;
         p_Branch : OUT  std_logic;
         p_MemRead : OUT  std_logic;
         p_MemtoReg : OUT  std_logic;
         p_MemWrite : OUT  std_logic;
         p_ALUsrc : OUT  std_logic;
         p_RegWrite : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK_i : std_logic := '0';
   signal Reset_i : std_logic := '0';

 	--Outputs
   signal p_writeData : std_logic_vector(31 downto 0);
   signal p_pc : std_logic_vector(31 downto 0);
   signal p_instruction : std_logic_vector(31 downto 0);
   signal p_ALURES : std_logic_vector(31 downto 0);
   signal p_ALUA : std_logic_vector(31 downto 0);
   signal p_ALUB : std_logic_vector(31 downto 0);
   signal p_RegDest : std_logic;
   signal p_Jump : std_logic;
   signal p_Branch : std_logic;
   signal p_MemRead : std_logic;
   signal p_MemtoReg : std_logic;
   signal p_MemWrite : std_logic;
   signal p_ALUsrc : std_logic;
   signal p_RegWrite : std_logic;

   -- Clock period definitions
   constant CLK_i_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPS32 PORT MAP (
          CLK_i => CLK_i,
          Reset_i => Reset_i,
          p_writeData => p_writeData,
          p_pc => p_pc,
          p_instruction => p_instruction,
          p_ALURES => p_ALURES,
          p_ALUA => p_ALUA,
          p_ALUB => p_ALUB,
          p_RegDest => p_RegDest,
          p_Jump => p_Jump,
          p_Branch => p_Branch,
          p_MemRead => p_MemRead,
          p_MemtoReg => p_MemtoReg,
          p_MemWrite => p_MemWrite,
          p_ALUsrc => p_ALUsrc,
          p_RegWrite => p_RegWrite
        );

   -- Clock process definitions
   CLK_i_process :process
   begin
		CLK_i <= '0';
		wait for CLK_i_period/2;
		CLK_i <= '1';
		wait for CLK_i_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_i_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
