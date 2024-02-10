library ieee;
use ieee.std_logic_1164.all;
entity Comparator is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           L : out  STD_LOGIC;
           E : out  STD_LOGIC;
           G : out  STD_LOGIC);
end Comparator;

architecture Behavioral of Comparator is

begin process(A,B)
begin
if(A<B) then 
L<='1';
G<='0';
E<='0';

elsif(A>B) then 
L<='0';
G<='1';
E<='0';

else
L<='0';
G<='0';
E<='1';

end if;
end process;

end Behavioral;


