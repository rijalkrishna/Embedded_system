--VHDL program for jk flip flop using process (2075 baisakh)
library ieee;
use ieee.std_logic_1164.all;

entity jk_ff is 
    port (
        j, k, clk: in std_logic;
        q, qbar: out std_logic
    );
end jk_ff;

architecture behavioral of jk_ff is 
    signal internal_q, internal_qbar: std_logic;
begin
    process (j, k, clk)
    begin
        if rising_edge(clk) then
            if (j = '1' AND k = '0') then
                internal_q <= '1';
                internal_qbar <= '0';
            elsif (j = '0' and k = '1') then 
                internal_q <= '0';
                internal_qbar <= '1';
            elsif (j = '1' and k = '1') then
                internal_q <= not internal_q;
                internal_qbar <= not internal_qbar;
            end if;
        end if;
    end process;

    -- Assign internal signals to output ports
    q <= internal_q;
    qbar <= internal_qbar;
end behavioral;


