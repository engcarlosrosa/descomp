-- Copyright (C) 1991-2016 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition"
-- CREATED		"Thu Sep 27 08:55:45 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY circuito_combinacional IS 
	PORT
	(
		RST_REG_ENTRADA :  IN  STD_LOGIC;
		HABILITA_REG_ENTRADA :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		RST_REG_SAIDA :  IN  STD_LOGIC;
		HABILITA_REG_SAIDA :  IN  STD_LOGIC;
		ENTRADA :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		OPERACAO :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		SAIDA :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END circuito_combinacional;

ARCHITECTURE bdf_type OF circuito_combinacional IS 

COMPONENT ula
	PORT(clk : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 func : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 flag : OUT STD_LOGIC;
		 Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT registrador
GENERIC (Vector_Size : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(4 DOWNTO 0);


BEGIN 



b2v_inst : ula
PORT MAP(clk => CLK,
		 A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_1,
		 func => OPERACAO,
		 Q => SYNTHESIZED_WIRE_2);


b2v_REG_ENTRADA : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => HABILITA_REG_ENTRADA,
		 reset => RST_REG_ENTRADA,
		 d => ENTRADA,
		 q => SYNTHESIZED_WIRE_1);


b2v_REG_SAIDA : registrador
GENERIC MAP(Vector_Size => 5
			)
PORT MAP(clk => CLK,
		 enable => HABILITA_REG_SAIDA,
		 reset => RST_REG_SAIDA,
		 d => SYNTHESIZED_WIRE_2,
		 q => SYNTHESIZED_WIRE_0);


END bdf_type;