--------------------------------------------
-- (c) Jean-Christophe Le Lann - 2022
---------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library uart_lib;
use uart_lib.uart_cst.all;
use uart_lib.uart_api.all;

library soc_lib;
use soc_lib.soc_pkg.all;

entity soc_tb is
end entity;

architecture bhv of soc_tb is

  signal reset_n : std_logic := '0';
  signal running : boolean := true;

  -- WARNING : clock is definied in uart_api

  signal leds     : std_logic_vector(15 downto 0);
  signal switches : std_logic_vector( 7 downto 0);

  signal debug     : std_logic_vector(15 downto 0);
  signal data_back : std_logic_vector(31 downto 0);

  constant transactions : bus_transactions_t :=(
    --           ADDR        DATA
    (BUS_WR, x"00000000",x"00000005"),--wr LED
    (BUS_RD, x"00000001",x"--------"),--rd SWITCHES
    -- writing to BRAM1
    (BUS_WR, x"00000002",x"000000AA"),
    (BUS_WR, x"00000003",x"000000AA"),
    (BUS_WR, x"00000004",x"000000AA"),
    (BUS_WR, x"00000005",x"000000AA"),
    (BUS_WR, x"00000006",x"000000AA"),
    (BUS_WR, x"00000101",x"000000AA"),
    -- WRITING to BRAM2
    (BUS_WR, x"00000102",x"00000001"),
    (BUS_WR, x"00000103",x"00000002"),
    (BUS_WR, x"00000104",x"00000003"),
    (BUS_WR, x"00000105",x"00000004"),
    (BUS_WR, x"00000106",x"00000005"),
    (BUS_WR, x"00000201",x"00000006"),
    -- READING from BRAM2
    (BUS_RD, x"00000102",x"--------"),
    (BUS_RD, x"00000103",x"--------"),
    (BUS_RD, x"00000104",x"--------"),
    (BUS_RD, x"00000105",x"--------"),
    (BUS_RD, x"00000106",x"--------"),
    (BUS_RD, x"00000201",x"--------"),
    -- READING from BRAM1
    (BUS_RD, x"00000002",x"--------"),
    (BUS_RD, x"00000003",x"--------"),
    (BUS_RD, x"00000004",x"--------"),
    (BUS_RD, x"00000005",x"--------"),
    (BUS_RD, x"00000006",x"--------"),
    (BUS_RD, x"00000101",x"--------"),
    --
    (BUS_WR, x"00000042",x"deadbeef"),
    (BUS_RD, x"00000042",x"--------")
  );

begin
  --------------------------------------------------------------------------------
  -- clock and reset
  --------------------------------------------------------------------------------
  reset_n <= '0','1' after 123 ns;

  clk100 <= not(clk100) after HALF_PERIOD when running else clk100;
  --------------------------------------------------------------------------------
  -- Design Under Test
  --------------------------------------------------------------------------------
  dut : entity soc_lib.soc(rtl)
    port map (
      reset_n  => reset_n ,
      clk100   => clk100  ,
      rx       => tx      ,
      tx       => rx      ,
      leds     => leds    ,
      switches => switches
    );
  -------------------------------
  -- User switches
  -------------------------------
  switches <= x"cd";
  --------------------------------------------------------------------------------
  -- sequential stimuli
  --------------------------------------------------------------------------------
  serial_sending : process
    type array_bytes is array(3 downto 0) of std_logic_vector(7 downto 0);
    variable bytes : array_bytes;
    variable transaction : bus_cmd;
  begin
    report "running testbench for soc(rtl)";
    report "waiting for asynchronous reset";
    wait until reset_n='1';
    wait_cycles(100);
    report "executing bus master instructions sequence";
    for i in transactions'range loop
      transaction := transactions(i);
      send_byte(tx,transaction.ctrl);--bus control
      send_word(transaction.addr,tx);--bus address
      if transaction.ctrl(1 downto 0)="01" then
        report "RD " & to_hstring(transaction.addr);
      else
        send_word(transaction.data,tx);--bus data
        report "WR " & to_hstring(transaction.addr) & " " & to_hstring(transaction.data);
      end if;
      wait_cycles(10);
    end loop;
    wait_cycles(4000);
    report "end of simulation";
    running <= false;
    wait;
  end process;

  old_rx : process
  begin
    wait until rising_edge(clk100);
    rx_1t <= rx;
  end process;

  serial_receiving:process
  begin
    receive_word(data_back);
    report "received " & to_hstring(data_back);
  end process;
end bhv;
