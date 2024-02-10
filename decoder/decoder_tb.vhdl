library ieee;
use ieee.std_logic_1164.all;

entity tb_Decoder is
end tb_Decoder;

architecture testbench of tb_Decoder is
    signal A : std_logic_vector(1 downto 0) := "00";
    signal Y : std_logic_vector(3 downto 0);

    component Decoder
        Port ( A : in  STD_LOGIC_VECTOR (1 downto 0);
               Y : out  STD_LOGIC_VECTOR (3 downto 0));
    end component;

begin
    uut: Decoder port map(A, Y);

    process
    begin
        A <= "00";
        wait for 10 ns;

        A <= "01";
        wait for 10 ns;

        A <= "10";
        wait for 10 ns;

        A <= "11";
        wait for 10 ns;

        A <= "01";
        wait for 10 ns;

        -- Add more test cases as needed

        wait;
    end process;

end testbench;

