library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ula is
port(   clk : in std_logic; 
        A,B : in signed(4 downto 0); 
        func : in std_logic; 
		  flag : out boolean;
        Q : out signed(4 downto 0) 
        );
end ula;

architecture Behavioral of ula is

signal R1,R2,R3 : signed(4 downto 0) := (others => '0');

begin

R1 <= A;
R2 <= B;
Q <= R3;

process(all)
begin
        case func is
            when '0' => 
                R3 <= R1 + R2;
            when '1' => 
                R3 <= R1 - R2;
				if R3 = 0 then
					flag <= true;
				else 
					flag <= false;
				end if;
        end case;           
end process;    

end Behavioral;