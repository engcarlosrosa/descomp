-- Quartus Prime VHDL Template
-- Single-Port ROM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_port_rom is

	generic 
	(
		DATA_WIDTH : natural := 8;
		ADDR_WIDTH : natural := 8
	);

	port 
	(
		clk		: in std_logic;
		addr	: in natural range 0 to 2**ADDR_WIDTH - 1;
		q		: out std_logic_vector((DATA_WIDTH -1) downto 0)
	);

end entity;

architecture rtl of single_port_rom is

	-- Build a 2-D array type for the ROM
	subtype word_t is std_logic_vector((DATA_WIDTH-1) downto 0);
	type memory_t is array(2**ADDR_WIDTH-1 downto 0) of word_t;

	function init_rom
		return memory_t is 
		variable tmp : memory_t := (others => (others => '0'));
	begin 
		--for addr_pos in 0 to 2**ADDR_WIDTH - 1 loop 
			-- Initialize each address with the address itself
			--tmp(addr_pos) := std_logic_vector(to_unsigned(addr_pos, DATA_WIDTH));
		--end loop;
			--tmp := "01000011011000010111001001101100011011110111001100001101000010100100000101000001";
			tmp(0) := std_logic_vector(to_unsigned(65, DATA_WIDTH));
			tmp(1) := std_logic_vector(to_unsigned(110, DATA_WIDTH));
			tmp(2) := std_logic_vector(to_unsigned(116, DATA_WIDTH));
			tmp(3) := std_logic_vector(to_unsigned(111, DATA_WIDTH));
			tmp(4) := std_logic_vector(to_unsigned(110, DATA_WIDTH));
			tmp(5) := std_logic_vector(to_unsigned(105, DATA_WIDTH));
			tmp(6) := std_logic_vector(to_unsigned(111, DATA_WIDTH));
			tmp(7) := std_logic_vector(to_unsigned(32, DATA_WIDTH));
			tmp(8) := std_logic_vector(to_unsigned(67, DATA_WIDTH));
			tmp(9) := std_logic_vector(to_unsigned(97, DATA_WIDTH));
			tmp(10) := std_logic_vector(to_unsigned(114, DATA_WIDTH));
			tmp(11) := std_logic_vector(to_unsigned(108, DATA_WIDTH));
			tmp(12) := std_logic_vector(to_unsigned(111, DATA_WIDTH));
			tmp(13) := std_logic_vector(to_unsigned(115, DATA_WIDTH));
			tmp(14) := std_logic_vector(to_unsigned(32, DATA_WIDTH));
			tmp(15) := std_logic_vector(to_unsigned(74, DATA_WIDTH));
			tmp(16) := std_logic_vector(to_unsigned(111, DATA_WIDTH));
			tmp(17) := std_logic_vector(to_unsigned(97, DATA_WIDTH));
			tmp(18) := std_logic_vector(to_unsigned(111, DATA_WIDTH));
			tmp(19) := std_logic_vector(to_unsigned(46, DATA_WIDTH));

		return tmp;
	end init_rom;	 

	-- Declare the ROM signal and specify a default value.	Quartus Prime
	-- will create a memory initialization file (.mif) based on the 
	-- default value.
	signal rom : memory_t := init_rom;

begin

	process(clk)
	begin
	if(rising_edge(clk)) then
		q <= rom(addr);
	end if;
	end process;

end rtl;

