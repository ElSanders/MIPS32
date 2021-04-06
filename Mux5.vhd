library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Mux5 is
		Port(sel: in std_logic;
			  A: in std_logic_vector(4 downto 0):="00000";
			  B: in std_logic_vector(4 downto 0):="00000";
			  C: out std_logic_vector(4 downto 0):="00000"
			  );
end Mux5;

architecture Behavioral of Mux5 is

begin
C<=A when sel='1' else B;
end Behavioral;

