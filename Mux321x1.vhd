library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Mux321x1 is
		Port(sel: in std_logic:='0';
			  A: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			  B: in std_logic_vector(31 downto 0):="00000000000000000000000000000000";
			  C: out std_logic_vector(31 downto 0):="00000000000000000000000000000000"
			  );
end Mux321x1;

architecture Behavioral of Mux321x1 is

begin
--when
C<=A when sel='1' else B;

end Behavioral;

