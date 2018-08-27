
-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;

-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
use ieee.std_logic_1164.all;

-- SIGNED and UNSIGNED types, and relevant functions
use ieee.numeric_std.all;



entity flipflop is

	port
	(
		-- Input ports
		d	: in  STD_LOGIC;
		clk: in  STD_LOGIC;

		-- Output ports
		q	: out STD_LOGIC
	);
end entity;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture fluxo of flipflop is

	-- Declarations (optional)

begin

	-- Process Statement (optional)
		process (clk)
		begin
			if (rising_edge(CLK)) then
				q <= d;
			end if;
		end process;


	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end architecture;

-- Update the register output on the clock's rising edge

