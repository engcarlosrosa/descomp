library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_6_1_ is
    Port ( SEL : in  STD_LOGIC_VECTOR (3 downto 0);
           A,B,C,D,E,F   : in  STD_LOGIC;
           Y             : out STD_LOGIC;
end mux_6_1_;

architecture mux_arch of mux_6_1_ is
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