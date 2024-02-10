library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplexer is
end tb_multiplexer;

architecture testbench of tb_multiplexer is
    signal A : STD_LOGIC_VECTOR(3 downto 0);
    signal Y : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR(1 downto 0);

    -- Include the declaration of the Multiplexer component
    component Multiplexer
        Port (A: in STD_LOGIC_VECTOR(3 downto 0);
              Y: out STD_LOGIC;
              S: in STD_LOGIC_VECTOR(1 downto 0));
    end component;

begin
    -- Instantiate the Multiplexer component
    uut: Multiplexer port map (A, Y, S);

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1: S = "00", A = "0000"
        S <= "00";
        A <= "0000";
        wait for 10 ns;
        assert (Y = '0') report "Test case 1 failed" severity error;

        -- Test case 2: S = "01", A = "0001"
        S <= "01";
        A <= "0001";
        wait for 10 ns;
        assert (Y = '0') report "Test case 2 failed" severity error;

        -- Test case 3: S = "10", A = "0010"
        S <= "10";
        A <= "0010";
        wait for 10 ns;
        assert (Y = '0') report "Test case 3 failed" severity error;

        -- Test case 4: S = "11", A = "0011"
        S <= "11";
        A <= "0011";
        wait for 10 ns;
        assert (Y = '1') report "Test case 4 failed" severity error;

        -- Add more test cases as needed

        wait;
    end process stimulus_process;

end testbench;

