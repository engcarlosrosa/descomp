-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;


-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;

entity registrador is

	port
	(
		-- Input ports
		CLK	: in  STD_LOGIC;
		D	:		 in  STD_LOGIC_VECTOR(7 DOWNTO 0);

		-- Output ports
		Q 	:		out STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
end entity;




architecture fluxo of registrador is

	-- Declarations (optional)

begin

	process (CLK)
	begin
		if (rising_edge(CLK)) then
			Q(0) <= D(0);
			Q(1) <= D(1);
			Q(2) <= D(2);
			Q(3) <= D(3);
			Q(4) <= D(4);
			Q(5) <= D(5);
			Q(6) <= D(6);
			Q(7) <= D(7);
		end if;
	end process;

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end architecture ;

-- Update the register output on the clock's rising edge


