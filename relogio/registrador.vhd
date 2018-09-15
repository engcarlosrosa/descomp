library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registrador is
	Generic (Vector_Size: natural:=5);
	port ( 
			d:   in  STD_LOGIC_VECTOR((Vector_Size - 1) downto 0);
			clk: in  STD_LOGIC;
			enable: in STD_LOGIC;
			reset: in STD_LOGIC;
			q:   out STD_LOGIC_VECTOR((Vector_Size - 1) downto 0)
	);
end entity;

architecture reg_arch of registrador is

begin
	process (clk, reset)
	begin
		-- Reset whenever the reset signal goes low, regardless of the clock
		-- or the clock enable
		if (reset = '0') then
			q <= (OTHERS => '0');
		-- If not resetting, and the clock signal is enabled on this register, 
		-- update the register output on the clock's rising edge
		elsif (rising_edge(clk)) then
			if (enable = '1') then
				q <= d;
			end if;
		end if;
	end process;

end reg_arch;