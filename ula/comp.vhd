library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity comp is
port(   A,B : in signed(3 downto 0); 
		  gt : out std_logic;
        eq : out std_logic;
		  lt : out std_logic
        );
end comp;

architecture comp of comp is
begin
		process(A, B)
		begin
				gt <= '0';
				eq <= '0';
				lt <= '0';
				if(A > B) then
					gt <= '1';
				elsif (A = B) then
					eq <= '1';
				elsif (A < B) then
					lt <= '1';
				end if;
		end process;
end comp;