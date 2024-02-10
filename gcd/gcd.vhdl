library ieee;
use ieee.std_logic_1164.all;

entity fsmgcd is

port(
    clk, reset: in std_logic;
	A, B: in integer;
	GCD: out integer
);

end fsmgcd;

architecture behavior of fsmgcd is
    type state is (start, input, output, check, updatex, updatey);
    signal current_state, next_state: state;
begin

    state_register: process (clk, reset) 
    begin
        if reset = '1' then
            current_state <= start;
        elsif rising_edge(clk) then
            current_state <= next_state;
        end if;
    end process;

    compute: process(a, b, current_state)
        variable x, y: integer;
    begin

        case current_state is
            when start =>
                next_state <= input;
                -- gcd <= 100;
            when input =>
                x := a;
                y := b;
                next_state <= check;
                -- gcd <= 101;
            when check =>
                if x < y then
                    next_state <= updatey;
                -- gcd <= 102;
                elsif y < x then
                    next_state <= updatex;
                -- gcd <= 103;
                else
                    next_state <= output;
                -- gcd <= 104;
                end if;
            when updatex =>
                -- gcd <= 105;
                x := x - y;
                next_state <= check;
            when updatey =>
                -- gcd <= 106;
                y := y - x;
                next_state <= check;
            when output =>
                -- gcd <= 107;
                gcd <= x;
                next_state <= start;
            when others =>
                -- gcd <= 108;
                next_state <= start;
        end case;

    end process compute;

end behavior; 
