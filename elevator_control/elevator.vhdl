---elevator control unit using vhdl (2078 baisakh)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity elevator_control is 
  port(
    clk: in std_logic;
    reset: in std_logic;
    floor_up: in std_logic;
    floor_down: in std_logic;
    floor_num: out std_logic_vector(3 downto 0)
  );
end elevator_control;

architecture behavioral of elevator_control is
  type state_type is (idle, up, down);
  signal curr_state, next_state: state_type;
  signal curr_floor: integer range 0 to 15;
begin
  process(clk, reset)
  begin
    if reset = '1' then 
      curr_state <= idle;
      curr_floor <= 0;
    elsif clk'event and clk = '1' then
      curr_state <= next_state;
      curr_floor <= curr_floor + 1;
    end if;
  end process;

  process(curr_state, floor_up, floor_down)
  begin
    case curr_state is 
      when idle =>
        if floor_up = '1' then 
          next_state <= up;
        elsif floor_down = '1' then
          next_state <= down;
        else
          next_state <= idle;
        end if;
      when up =>
        if floor_down = '1' then 
          next_state <= down;
        else
          next_state <= up;
        end if;
      when down =>
        if floor_up = '1' then 
          next_state <= up;
        else
          next_state <= down;
        end if;
    end case;
  end process;

  floor_num <= std_logic_vector(to_unsigned(curr_floor, 4));
end behavioral;
				    

