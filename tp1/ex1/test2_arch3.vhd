library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_3 is
  port(
    reset_n : in std_logic;
    clk : in std_logic;
    go : in std_logic;
    count: out unsigned(7 downto 0)
  );
end entity;

architecture arch_3 of test_3 is
  type state_t is (IDLE, PROCESSING, WAITING);
  signal state : state_t;
  signal count_s : unsigned(7 downto 0);

  process(reset_n, clk)
  begin
    if reset_n = '0' then
      state <= IDLE;
    elsif rising_edge(clk) then
      if go = '1' then
        case state is
          when IDLE =>
            state <= PROCESSING;
          when PROCESSING =>
            if count_s < 25 then
              state <= PROCESSING;
            else
              state <= WAITING;
            end if;
          when WAITING =>
            state <= IDLE;
          when others =>
            state <= IDLE;
        end case;
      end if;
    end if;
  end process;

  process(reset_n, clk)
  begin
    if reset_n = '0' then
      count_s <= to_unsigned(0, 8);
    elsif rising_edge(clk) then
      if state = PROCESSING then
        if count_s < 25 then
          count_s <= count_s + 1;
        else
          count_s <= to_unsigned(0, 8);
        end if;
      else
        count_s <= to_unsigned(0, 8);
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      null;
    end if;
  end process;

  count <= count_s;

end arch_3;
