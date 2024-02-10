library ieee;
use ieee.std_logic_1164.all;

entity fsmgcd_tb is
end fsmgcd_tb;

architecture behavior of fsmgcd_tb is

    signal clk, reset: std_logic;
    signal a, b, gcd: integer;
    component fsmgcd 
        port(
            clk, reset: in std_logic;
            A, B: in integer;
            GCD: out integer
        );
    end component;

begin
    
    fsmgcd1: fsmgcd port map(clk => clk, reset => reset, a => a, b => b, gcd => gcd);

    clock: process 
    begin
        clk <= '1';
        wait for 100 ns;
        clk <= '0';
        wait for 100 ns;
    end process;

    process
    begin
        wait for 100 ns;
        reset <= '0';
        a <= 10;
        b <= 15;

        wait for 2100 ns;
        reset <= '1';
        a <= 3456;
        b <= 234;

        wait for 600 ns;
        reset <= '0';
        
        wait;
    end process;

end behavior; 
