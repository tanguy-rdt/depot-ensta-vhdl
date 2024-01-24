library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library uart_lib;
library hypo_lib;

entity top is
  port(
    reset_n    : in std_logic;--mapped on Switch 15
    clk100     : in std_logic;
    switches   : in std_logic_vector(1 downto 0);
    rx         : in std_logic;
    tx         : out std_logic;
    --mapped on leds :
    info      : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rtl of top is
  signal uart_send_ready : std_logic;
  signal uart_send_push  : std_logic;
  signal uart_send_byte  : std_logic_vector(7 downto 0);
  signal uart_recv_avail : std_logic;
  signal uart_recv_pop   : std_logic;
  signal uart_recv_byte  : std_logic_vector(7 downto 0);
  signal debug_uart      : std_logic_vector(7 downto 0);--not used
begin

  uart_i : entity uart_lib.uart
  port map(
    reset_n         => reset_n,
    clk100          => clk100,
    -- PC interface => ,
    rx              => rx,
    tx              => tx,
    -- ip inferface => ,
    ip_to_uart_pop  => uart_recv_pop,
    ip_to_uart_push => uart_send_push,
    ip_to_uart_data => uart_send_byte,
    uart_to_ip_data => uart_recv_byte,
    uart_rcvr_avail => uart_recv_avail,
    uart_sndr_ready => uart_send_ready,
    debug           => debug_uart
  );

  hypocampe_i : entity hypo_lib.core
    port map (
      reset_n => switches(0),
      clk => clk100,
      go => switches(1),
      -- UART access
      uart_send_ready => uart_send_ready,
      uart_send_push  => uart_send_push,
      uart_send_byte  => uart_send_byte,
      uart_recv_avail => uart_recv_avail,
      uart_recv_pop   => uart_recv_pop,
      uart_recv_byte  => uart_recv_byte,
      info            => info
    );
end rtl;
