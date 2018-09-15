library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity relogio is
port(   clk : in std_logic; 
        A,B : in signed(7 downto 0); 
        func : in unsigned(2 downto 0); 
        Q : out signed(7 downto 0) 
        );
end relogio;

architecture Behavioral of relogio is
begin
end Behavioral;

--clock = 2 x 10^-8 s
--
--US = US + 1
--
--IF US = 10 THEN
--	US = 0
--	DS = DS+1
--	
--IF DS = 6 THEN
--	UM = UM + 1
--	US = 0
--	DS = 0
--	
--IF UM = 10 THEN
--	UM = 0
--	DM = DM + 1
--	
--IF DM = 6 THEN
--	H = H + 1
--	UM = 0
--	DM = 0
--	
--IF H = 24 THEN
--	H = 00
--	US = 0
--	DS = 0
--	UM = 0
--	DM = 0
--	