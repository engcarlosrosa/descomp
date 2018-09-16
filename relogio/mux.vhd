library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_6x1 is
    Port ( SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           A,B,C,D,E,F   : in  STD_LOGIC_VECTOR (4 downto 0);
           Y             : out STD_LOGIC_VECTOR (4 downto 0));
end mux_6x1;

architecture mux_arch of mux_6x1 is
begin
process(SEL)
begin
	case SEL is
		when "0000" => 
			y <= A;
		when "0001" => 
			y <= B;
		when "0010" => 
			y <= C;
		when "0011" => 
			y <= D;
		when "0100" => 
			y <= E;
		when "0101" => 
			y <= F;
		when others => 
			y <= "00000";
	end case;
end process;
end mux_arch;