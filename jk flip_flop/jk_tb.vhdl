library ieee;
use ieee.std_logic_1164.all;

entity tb_jk_ff is
end tb_jk_ff;

architecture testbench of tb_jk_ff is
    signal j, k, clk, q, qbar: std_logic := '0';

    component jk_ff
        port (
            j, k, clk: in std_logic;
            q, qbar: out std_logic
        );
    end component;

begin
    uut: jk_ff port map(j, k, clk, q, qbar);

    -- Clock process
    process
    begin
        clk <= not clk after 5 ns;
        wait for 10 ns;
    end process;

    -- Stimulus process
    process
    begin
        wait for 20 ns;  -- Initial wait for stability

        j <= '1';
        k <= '0';
        wait for 20 ns;

        j <= '0';
        k <= '1';
        wait for 20 ns;

        j <= '1';
        k <= '1';
        wait for 20 ns;

        -- Add more test cases as needed

        wait;
    end process;

end testbench;

