
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_LCM is
end tb_LCM;

architecture testbench of tb_LCM is
    signal RESET, CLK: STD_LOGIC := '0';
    signal NUM1, NUM2, LCM_OUT: INTEGER := 0;

    component LCM
        Port (
            RESET : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            NUM1 : in  INTEGER;
            NUM2 : in  INTEGER;
            LCM_OUT : out  INTEGER
        );
    end component;

begin
    uut: LCM port map(RESET, CLK, NUM1, NUM2, LCM_OUT);

    -- Clock process
    process
    begin
        while now < 100 ns loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    process
    begin
        wait for 10 ns;  -- Initial wait for stability

        RESET <= '1';
        NUM1 <= 6;
        NUM2 <= 8;
        wait for 20 ns;

        RESET <= '0';
        wait for 20 ns;

        NUM1 <= 12;
        NUM2 <= 18;
        wait for 20 ns;

        NUM1 <= 0;
        NUM2 <= 5;
        wait for 20 ns;

        -- Add more test cases as needed

        wait;
    end process;

end testbench;

