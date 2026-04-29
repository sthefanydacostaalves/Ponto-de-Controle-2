library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity elevador is
    Port(
        clk     : in STD_LOGIC;
        rst     : in STD_LOGIC;
        pedidos : in STD_LOGIC_VECTOR(3 downto 0)
    );
end elevador;

architecture Behavioral of elevador is


    signal estado : unsigned(1 downto 0) := "00";
    signal UP, DOWN : STD_LOGIC;

begin

    process(estado, pedidos)
    begin
        UP <= '0';
        DOWN <= '0';

        -- térreo
        if estado = "00" then

            if pedidos(1)='1' or pedidos(2)='1' or pedidos(3)='1' then
                UP <= '1';
            end if;

        -- andar 1
        elsif estado = "01" then

            if pedidos(2)='1' or pedidos(3)='1' then
                UP <= '1';

            elsif pedidos(0)='1' then
                DOWN <= '1';
            end if;

        -- andar 2
        elsif estado = "10" then

            if pedidos(3)='1' then
                UP <= '1';

            elsif pedidos(0)='1' or pedidos(1)='1' then
                DOWN <= '1';
            end if;

        -- andar 3
        elsif estado = "11" then

            if pedidos(0)='1' or pedidos(1)='1' or pedidos(2)='1' then
                DOWN <= '1';
            end if;

        end if;
    end process;

  
    --Movimentação do elevador
    
    process(clk, rst)
    begin
        if rst = '1' then
            estado <= "00";

        elsif rising_edge(clk) then

            if UP = '1' then
                estado <= estado + 1;

            elsif DOWN = '1' then
                estado <= estado - 1;

            end if;

        end if;
    end process;


end Behavioral;