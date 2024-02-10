library ieee;
use ieee.std_logic_1164.all;

entity elevator_control_tb is
end elevator_control_tb;

architecture tb_architecture of elevator_control_tb is
  signal clk, reset, floor_up, floor_down : std_logic := '0';
  signal floor_num_out : std_logic_vector(3 downto 0);

  component elevator_control
    port (
      clk       : in std_logic;
      reset     : in std_logic;
      floor_up  : in std_logic;
      floor_down: in std_logic;
      floor_num : out std_logic_vector(3 downto 0)
    );
  end component;

begin
  -- Instantiate the elevator_control entity
  UUT: elevator_control
    port map (
      clk       => clk,
      reset     => reset,
      floor_up  => floor_up,
      floor_down=> floor_down,
      floor_num => floor_num_out
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
    floor_up <= '0';
    floor_down <= '0';
    wait for 10 ns;

    reset <= '0';
    wait for 10 ns;

    -- Test case 1: Move Up
    floor_up <= '1';
    wait for 10 ns;
    floor_up <= '0';
    wait for 10 ns;

    -- Test case 2: Move Down
    floor_down <= '1';
    wait for 10 ns;
    floor_down <= '0';
    wait for 10 ns;

    -- Test case 3: Stay Idle
    wait for 10 ns;

    -- Add more test cases as needed

    wait;
  end process;

end tb_architecture;

