library ieee;
use ieee.std_logic_1164.all;
entity Multiplexer is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           Y : out  STD_LOGIC;
           S : in  STD_LOGIC_VECTOR (1 downto 0));
end Multiplexer;

architecture Behavioral of Multiplexer is

begin

process(S,A)
begin
if(S="00") then
Y<=A(0);
elsif (S="01") then
Y<=A(1);
elsif (S="10") then
Y<=A(2);
else 
Y<=A(3);
end if;
end process;

end Behavioral;
