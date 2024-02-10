--3bit up counter using T flipflop
library ieee;
use ieee.std_logic_1164.all;

entity counter is
  port (
    clk: in std_logic;
    rst: in std_logic;
    q: out std_logic_vector(2 downto 0)
  );
end counter;

architecture behavioral of counter is
  component t_ff is
    port (
      t: in std_logic;
      clk: in std_logic;
      q: out std_logic;
      q_bar: out std_logic
    );
  end component;

  signal tff0_t, tff1_t: std_logic;  -- Intermediate signals
  signal tff0_q, tff1_q, tff2_q: std_logic;
begin
  tff0_t <= tff0_q xor tff1_q;  -- Intermediate signal for tff0
  tff1_t <= tff1_q xor tff2_q;  -- Intermediate signal for tff1

  tff0: t_ff
    port map (
      t => tff0_t,
      clk => clk,
      q => tff0_q,
      q_bar => open
    );

  tff1: t_ff
    port map (
      t => tff1_t,
      clk => clk,
      q => tff1_q,
      q_bar => open
    );

  tff2: t_ff
    port map (
      t => tff2_q,
      clk => clk,
      q => tff2_q,
      q_bar => open
    );

  q <= tff2_q & tff1_q & tff0_q;

  process(clk, rst)
  begin
    if rst = '1' then
      tff0_q <= '0';
      tff1_q <= '0';
      tff2_q <= '0';
    elsif rising_edge(clk) then
      tff0_q <= tff0_t;
      tff1_q <= tff1_t;
      tff2_q <= tff2_q;
    end if;
  end process;
end behavioral;





