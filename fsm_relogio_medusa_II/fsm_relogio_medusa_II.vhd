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

-- Generated by Quartus Prime Version 16.0.0 Build 211 04/27/2016 SJ Lite Edition
-- Created on Thu Oct 04 15:27:48 2018

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fsm_relogio_medusa_II IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        US_MAX : IN STD_LOGIC := '0';
        DS_MAX : IN STD_LOGIC := '0';
        UM_MAX : IN STD_LOGIC := '0';
        DM_MAX : IN STD_LOGIC := '0';
        UH_MAX : IN STD_LOGIC := '0';
        DH_MAX : IN STD_LOGIC := '0';
        INIT : IN STD_LOGIC := '0';
        palavra : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END fsm_relogio_medusa_II;

ARCHITECTURE BEHAVIOR OF fsm_relogio_medusa_II IS
    TYPE type_fstate IS (conta_segundo,zera_US,incrementa_DS,zera_DS,incrementa_UM,zera_UM,incrementa_DM,zera_DM,incrementa_UH,zera_UH,incrementa_DH,zera_DH);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,US_MAX,DS_MAX,UM_MAX,DM_MAX,UH_MAX,DH_MAX,INIT)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= conta_segundo;
            palavra <= "000000000000";
        ELSE
            palavra <= "000000000000";
            CASE fstate IS
                WHEN conta_segundo =>
                    IF (((((((US_MAX = '1') AND NOT((DS_MAX = '1'))) AND NOT((UM_MAX = '1'))) AND NOT((DM_MAX = '1'))) AND NOT((UH_MAX = '1'))) AND NOT((DH_MAX = '1')))) THEN
                        reg_fstate <= zera_US;
                    ELSIF (((((((DS_MAX = '1') AND NOT((US_MAX = '1'))) AND NOT((UM_MAX = '1'))) AND NOT((DM_MAX = '1'))) AND NOT((UH_MAX = '1'))) AND NOT((DH_MAX = '1')))) THEN
                        reg_fstate <= zera_DS;
                    ELSIF (((((((UM_MAX = '1') AND NOT((DS_MAX = '1'))) AND NOT((US_MAX = '1'))) AND NOT((DM_MAX = '1'))) AND NOT((UH_MAX = '1'))) AND NOT((DH_MAX = '1')))) THEN
                        reg_fstate <= zera_UM;
                    ELSIF (((((((DM_MAX = '1') AND NOT((DS_MAX = '1'))) AND NOT((UM_MAX = '1'))) AND NOT((US_MAX = '1'))) AND NOT((UH_MAX = '1'))) AND NOT((DH_MAX = '1')))) THEN
                        reg_fstate <= zera_DM;
                    ELSIF (((((((UH_MAX = '1') AND NOT((DS_MAX = '1'))) AND NOT((US_MAX = '1'))) AND NOT((DM_MAX = '1'))) AND NOT((UM_MAX = '1'))) AND NOT((DH_MAX = '1')))) THEN
                        reg_fstate <= zera_UH;
                    ELSIF (((((((DH_MAX = '1') AND NOT((DS_MAX = '1'))) AND NOT((UM_MAX = '1'))) AND NOT((DM_MAX = '1'))) AND NOT((UH_MAX = '1'))) AND NOT((US_MAX = '1')))) THEN
                        reg_fstate <= zera_DH;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= conta_segundo;
                    END IF;

                    palavra <= "000000000000";
                WHEN zera_US =>
                    reg_fstate <= incrementa_DS;

                    palavra <= "100000010000";
                WHEN incrementa_DS =>
                    IF (NOT((DS_MAX = '1'))) THEN
                        reg_fstate <= conta_segundo;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= incrementa_DS;
                    END IF;

                    palavra <= "000010000001";
                WHEN zera_DS =>
                    reg_fstate <= incrementa_UM;

                    palavra <= "010001011001";
                WHEN incrementa_UM =>
                    IF (NOT((UM_MAX = '1'))) THEN
                        reg_fstate <= conta_segundo;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= incrementa_UM;
                    END IF;

                    palavra <= "000011100110";
                WHEN zera_UM =>
                    reg_fstate <= incrementa_DM;

                    palavra <= "010010101010";
                WHEN incrementa_DM =>
                    IF (NOT((DM_MAX = '1'))) THEN
                        reg_fstate <= conta_segundo;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= incrementa_DM;
                    END IF;

                    palavra <= "000011000011";
                WHEN zera_DM =>
                    reg_fstate <= incrementa_UH;

                    palavra <= "010011011011";
                WHEN incrementa_UH =>
                    IF (NOT((UH_MAX = '1'))) THEN
                        reg_fstate <= conta_segundo;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= incrementa_UH;
                    END IF;

                    palavra <= "000100000100";
                WHEN zera_UH =>
                    reg_fstate <= incrementa_DH;

                    palavra <= "010100001100";
                WHEN incrementa_DH =>
                    IF (NOT((DH_MAX = '1'))) THEN
                        reg_fstate <= conta_segundo;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= incrementa_DH;
                    END IF;

                    palavra <= "000101000101";
                WHEN zera_DH =>
                    IF ((INIT = '1')) THEN
                        reg_fstate <= conta_segundo;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= zera_DH;
                    END IF;

                    palavra <= "010101010101";
                WHEN OTHERS => 
                    palavra <= "XXXXXXXXXXXX";
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;
