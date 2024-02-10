library ieee;
use ieee.std_logic_1164.all;

entity tb_comparator is
end tb_comparator;

architecture testbench of tb_comparator is
    signal A, B : STD_LOGIC_VECTOR(3 downto 0);
    signal L, E, G : STD_LOGIC;

    -- Include the declaration of the Comparator component
    component Comparator
        Port (A: in STD_LOGIC_VECTOR(3 downto 0);
              B: in STD_LOGIC_VECTOR(3 downto 0);
              L: out STD_LOGIC;
              E: out STD_LOGIC;
              G: out STD_LOGIC);
    end component;

begin
    -- Instantiate the Comparator component
    uut: Comparator port map (A, B, L, E, G);

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1: A = "0000", B = "0000"
        A <= "0000";
        B <= "0000";
        wait for 10 ns;
        assert (L = '0' and E = '1' and G = '0') report "Test case 1 failed" severity error;

        -- Test case 2: A = "0010", B = "0001"
        A <= "0010";
        B <= "0001";
        wait for 10 ns;
        assert (L = '0' and E = '0' and G = '1') report "Test case 2 failed" severity error;

        -- Test case 3: A = "1100", B = "1100"
        A <= "1100";
        B <= "1100";
        wait for 10 ns;
        assert (L = '0' and E = '1' and G = '0') report "Test case 3 failed" severity error;

        -- Add more test cases as needed

        wait;
    end process stimulus_process;

end testbench;

