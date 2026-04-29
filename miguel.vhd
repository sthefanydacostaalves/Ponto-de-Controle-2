library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity elevador is
    Port(
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        B0, B1, B2, B3 : in STD_LOGIC
    );
end elevador;

architecture Behavioral of elevador is


    signal pedidos : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

   
    process(clk, rst)
    begin
        if rst = '1' then
            pedidos <= "0000";

        elsif rising_edge(clk) then
            pedidos(0) <= pedidos(0) or B0;
            pedidos(1) <= pedidos(1) or B1;
            pedidos(2) <= pedidos(2) or B2;
            pedidos(3) <= pedidos(3) or B3;
        end if;
    end process;

end Behavioral;