library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_6x1 is
    Port ( SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           A,B,C,D,E,F,G   : in  STD_LOGIC_VECTOR (3 downto 0);
           Y             : out STD_LOGIC_VECTOR (3 downto 0));
end mux_6x1;

architecture mux_arch of mux_6x1 is
begin
process(SEL)
begin
	case SEL is
		when "000" => 
			y <= A;
		when "001" => 
			y <= B;
		when "010" => 
			y <= C;
		when "011" => 
			y <= D;
		when "100" => 
			y <= E;
		when "101" => 
			y <= F;
		when "110" => 
			y <= G;
		when others => 
			y <= "0000";
	end case;
end process;
end mux_arch;