-- lcm of two number as a finite state machine(2074 bhadra)


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LCM is
    Port (
        RESET : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        NUM1 : in  INTEGER;
        NUM2 : in  INTEGER;
        LCM_OUT : out  INTEGER
    );
end LCM;

architecture Behavioral of LCM is
    type state is (START, INPUT, OUTPUT);
    signal PS, NS : state;
    signal X, Y, LCM_temp : INTEGER := 0;

    function calculate_GCD(a, b : INTEGER) return INTEGER is
        variable temp_a, temp_b, temp_gcd : INTEGER := 0;
    begin
        temp_a := a;
        temp_b := b;
        while temp_b /= 0 loop
            temp_gcd := temp_a;
            temp_a := temp_b;
            temp_b := temp_gcd rem temp_b;
        end loop;
        return temp_a;
    end function;

begin
    seq_proc : process(CLK, RESET)
    begin
        if (RESET = '1') then 
            PS <= START;
        elsif (rising_edge(CLK)) then 
            PS <= NS;
        end if;
    end process seq_proc;

    comb_proc : process(NUM1, NUM2, PS)
    begin
        case PS is
            when START =>
                LCM_OUT <= 0;
                NS <= INPUT;

            when INPUT =>
                X <= NUM1;
                Y <= NUM2;
                LCM_temp <= (X / calculate_GCD(X, Y)) * Y;  -- Calculate LCM
                NS <= OUTPUT;

            when OUTPUT =>
                LCM_OUT <= LCM_temp;
                NS <= INPUT;

            when others =>
                LCM_OUT <= 0;
                NS <= INPUT;
        end case;
    end process comb_proc;

end Behavioral;


