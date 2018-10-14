library ieee;
use ieee.std_logic_1164.all;

entity FSMtopLevel is
    port (
        -- Entradas (nomenclatura definida no arquivo ¨.qsf¨)
        CLOCK_50 : in STD_LOGIC;
        KEY: in STD_LOGIC_VECTOR(3 DOWNTO 0);   --chaves de contato momentaneo.
--      SW: in STD_LOGIC_VECTOR(17 DOWNTO 0);    --chaves liga/desliga.

        -- Saidas da placa (nomenclatura definida no arquivo ¨.qsf¨)
        LEDR : out STD_LOGIC_VECTOR(17 DOWNTO 0) := (others => '0');
        LEDG : out STD_LOGIC_VECTOR(8 DOWNTO 0)  := (others => '0');
        HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
end entity;

architecture teste of FSMtopLevel is
    -- Declaraçao dos Componentes:
    COMPONENT testeFSM is
        PORT (
            reset       :    IN STD_LOGIC;
            clock       :    IN STD_LOGIC;
            bt1     :    IN STD_LOGIC;
            bt2     :    IN STD_LOGIC;
            bt3     :    IN STD_LOGIC;
            saida   :    OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
    --
    COMPONENT fluxoDados is
        PORT (
            entradaHex : in STD_LOGIC_VECTOR(3 DOWNTO 0);
            saida7seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;

    -- Fios:
    signal auxReset, auxBt1, auxBt2, auxBt3, auxBt1n : std_logic;
    signal auxHexValue : std_logic_vector (3 downto 0);
    signal aux7seg     : std_logic_vector (6 downto 0);

    constant usarDetectorBorda : boolean := FALSE;
--  constant usarDetectorBorda : boolean := TRUE;

begin
-- Instanciando os componentes:
maqEstados : testeFSM
    port map (
--  <formal_input> => <expression>,
        reset   => auxReset, clock => CLOCK_50, bt1 => auxBt1, bt2 => auxBt2, bt3 => auxBt3,
--      <formal_output> => <signal>,
        saida => auxHexValue
    );

fluxo : fluxoDados
        port map (
            entradaHex => auxHexValue, saida7seg => aux7seg
        );

comDetectorBorda:
    if (usarDetectorBorda) generate
        detectorSub0: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(0)), saida => auxReset);
        detectorSub1: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(1)), saida => auxBt1);
        detectorSub2: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(2)), saida => auxBt2);
        detectorSub3: work.edgeDetector(bordaSubida) port map (clk => CLOCK_50, entrada => (not KEY(3)), saida => auxBt3);
    end generate;

semDetectorBorda:
    if (not (usarDetectorBorda)) generate
        auxReset <= not KEY(0);
        auxBt1   <= not KEY(1);
        auxBt2   <= not KEY(2);
        auxBt3   <= not KEY(3);
    end generate;

    --Fazendo as interligacoes:
    LEDG(0)  <= not KEY(0);
    LEDG(1)  <= not KEY(1);
    LEDG(2)  <= not KEY(2);
    LEDG(3)  <= not KEY(3);

    HEX0 <= aux7seg;
end architecture;