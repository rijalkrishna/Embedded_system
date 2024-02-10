--d flip flop using vhdl
library ieee;
use ieee.std_logic_1164.all;

entity d_flip_flop is
    port(
        clk   : in std_logic;
        d     : in std_logic;
        reset : in std_logic;
        q     : out std_logic;
        q_bar : out std_logic
    );
end d_flip_flop;

architecture behavioral of d_flip_flop is
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            q <= '0';
            q_bar <= '1';
        elsif rising_edge(clk) then
            q <= d;
            q_bar <= not d;
        end if;
    end process;
end behavioral;

