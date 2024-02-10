library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop_tb is
end d_flip_flop_tb;

architecture tb_architecture of d_flip_flop_tb is
  signal clk, d, reset, q, q_bar: std_logic := '0';

  component d_flip_flop
    port (
      clk   : in std_logic;
      d     : in std_logic;
      reset : in std_logic;
      q     : out std_logic;
      q_bar : out std_logic
    );
  end component;

begin
  -- Instantiate the d_flip_flop entity
  UUT: d_flip_flop
    port map (
      clk   => clk,
      d     => d,
      reset => reset,
      q     => q,
      q_bar => q_bar
    );

  -- Clock process
  process
  begin
    clk <= '0';
    wait for 5 ns;
    clk <= '1';
    wait for 5 ns;
  end process;

  -- Stimulus process
  process
  begin
    reset <= '1';
    wait for 10 ns;

    reset <= '0';
    wait for 10 ns;

    -- Test case 1: Set D to '1' and observe Q
    d <= '1';
    wait for 10 ns;
    assert q = '1' and q_bar = '0' report "Error in Test Case 1" severity failure;

    -- Test case 2: Set D to '0' and observe Q
    d <= '0';
    wait for 10 ns;
    assert q = '0' and q_bar = '1' report "Error in Test Case 2" severity failure;

    -- Add more test cases as needed

    wait;
  end process;

end tb_architecture;

