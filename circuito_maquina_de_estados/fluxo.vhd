library ieee;
use ieee.std_logic_1164.all;

entity fluxoDados is
    port (
        entradaHex: in STD_LOGIC_VECTOR(3 DOWNTO 0);
        saida7seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
    );
end entity;

architecture teste of fluxoDados is

begin
-- instaciaçao sem declaracao de componente:
display : work.conversorHEX7Seg
    port map (
        dadoHex => entradaHex, apaga => '0', negativo => '0', overFlow => '0', saida7seg => saida7seg
        );
end architecture;