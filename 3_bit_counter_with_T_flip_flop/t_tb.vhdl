library ieee;
use ieee.std_logic_1164.all;

entity counter_tb is
end counter_tb;

architecture tb_architecture of counter_tb is
  signal clk, rst: std_logic := '0';
  signal q_out: std_logic_vector(2 downto 0);

  component counter
    port (
      clk: in std_logic;
      rst: in std_logic;
      q: out std_logic_vector(2 downto 0)
    );
  end component;

begin
  -- Instantiate the counter entity
  UUT: counter
    port map (
      clk => clk,
      rst => rst,
      q => q_out
    );

  -- Clock process
  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  -- Stimulus and monitor process
  process
  begin
    rst <= '1';
    wait for 10 ns;

    rst <= '0';
    wait for 10 ns;

    -- Test case 1: Observe initial state
    wait for 10 ns;
    assert q_out = "000" report "Error in Test Case 1" severity failure;

    -- Test case 2: Count one clock cycle
    wait for 10 ns;
    assert q_out = "001" report "Error in Test Case 2" severity failure;

    -- Test case 3: Reset and count again
    rst <= '1';
    wait for 10 ns;
    rst <= '0';
    wait for 10 ns;
    assert q_out = "000" report "Error in Test Case 3" severity failure;

    -- Add more test cases as needed

    wait;
  end process;

end tb_architecture;

