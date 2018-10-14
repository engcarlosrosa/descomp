library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity demux is
 port(
 
 Q : in STD_LOGIC;
 SEL: in STD_LOGIC_VECTOR(2 downto 0);
 A,B,C,D,E,F: out STD_LOGIC
 );
end demux;
 
architecture demux_arch of demux is
begin
 A <= Q when (SEL = "000") else '0' ;
 B <= Q when (SEL = "001") else '0' ;
 C <= Q when (SEL = "010") else '0' ;
 D <= Q when (SEL = "011") else '0' ;
 E <= Q when (SEL = "100") else '0' ;
 F <= Q when (SEL = "101") else '0' ;
end demux_arch;