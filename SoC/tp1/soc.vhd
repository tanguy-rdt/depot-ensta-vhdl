library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ip_lib;
library uart_bus_master_lib;
library soc_lib;
use soc_lib.soc_pkg.all;

entity soc is
    generic (
        ADDRESS_LEDS_START       : unsigned(31 downto 0) := x"00000000";
        ADDRESS_LEDS_END         : unsigned(31 downto 0) := x"00000000";
        ADDRESS_SWITCHES_START   : unsigned(31 downto 0) := x"00000001";
        ADDRESS_SWITCHES_END     : unsigned(31 downto 0) := x"00000001";
        ADDRESS_BRAM_START       : unsigned(31 downto 0) := x"00000001";
        ADDRESS_BRAM_END         : unsigned(31 downto 0) := x"00000101"
    );
    port (
        reset_n     : in std_logic;
        clk100      : in std_logic;
        rx          : in std_logic;
        switches    : in  std_logic_vector(7 downto 0);
        tx          : out std_logic;
        leds        : out std_logic_vector(15 downto 0)
    );
end entity soc;

architecture rtl of soc is
    signal bus_to_slave_en            : std_logic;
    signal bus_to_slave_wr            : std_logic;
    signal bus_to_slave_addr          : unsigned(31 downto 0);
    signal bus_to_slave_data          : std_logic_vector(31 downto 0);
    signal slave_to_bus_data          : std_logic_vector(31 downto 0);
    signal slave_to_bus_data_leds     : std_logic_vector(31 downto 0);
    signal slave_to_bus_data_switches : std_logic_vector(31 downto 0);
    signal slave_to_bus_data_bram     : std_logic_vector(31 downto 0);
    signal slave_to_bus_data_or       : std_logic_vector(31 downto 0);
begin
    uart_master_inst : entity uart_bus_master_lib.uart_bus_master
    port map (
        reset_n => reset_n,
        clk100 => clk100, 
        rx => rx,
        tx => tx,
        master_to_bus_en => bus_to_slave_en,
        master_to_bus_wr => bus_to_slave_wr,
        master_to_bus_addr => bus_to_slave_addr,
        master_to_bus_data => bus_to_slave_data,
        bus_to_master_data => slave_to_bus_data_or
    );

    ip_switches_inst : entity ip_lib.ip_switches
    port map (
        reset_n             => reset_n,
        clk                 => clk100,
        bus_to_slave_en     => bus_to_slave_en,
        bus_to_slave_wr     => bus_to_slave_wr,
        bus_to_slave_addr   => bus_to_slave_addr,
        bus_to_slave_data   => bus_to_slave_data,
        slave_to_bus_data   => slave_to_bus_data_switches,
        switches            => switches
    );

    ip_leds_inst : entity ip_lib.ip_leds
    port map (
        reset_n             => reset_n,
        clk                 => clk100,
        bus_to_slave_en     => bus_to_slave_en,
        bus_to_slave_wr     => bus_to_slave_wr,
        bus_to_slave_addr   => bus_to_slave_addr,
        bus_to_slave_data   => bus_to_slave_data,
        slave_to_bus_data   => slave_to_bus_data_leds,
        leds                => leds
    );

    ip_bram_inst : entity ip_lib.ip_bram
    port map (
        reset_n             => reset_n,
        clk                 => clk100,
        bus_to_slave_en     => bus_to_slave_en,
        bus_to_slave_wr     => bus_to_slave_wr,
        bus_to_slave_addr   => bus_to_slave_addr,
        bus_to_slave_data   => bus_to_slave_data,
        slave_to_bus_data   => slave_to_bus_data_bram
    );
    
    big_mux: process(bus_to_slave_addr, slave_to_bus_data, slave_to_bus_data_leds, slave_to_bus_data_switches, slave_to_bus_data_bram)
    begin
        if ((bus_to_slave_addr >= ADDRESS_LEDS_START) and (bus_to_slave_addr <= ADDRESS_LEDS_END)) then
            slave_to_bus_data <= slave_to_bus_data_leds;
        elsif ((bus_to_slave_addr >= ADDRESS_SWITCHES_START) and (bus_to_slave_addr <= ADDRESS_SWITCHES_END)) then
            slave_to_bus_data <= slave_to_bus_data_switches;
        elsif ((bus_to_slave_addr >= ADDRESS_BRAM_START) and (bus_to_slave_addr <= ADDRESS_BRAM_END)) then
            slave_to_bus_data <= slave_to_bus_data_bram;
        else
            slave_to_bus_data <= (others => '0');
        end if;
    end process;
end rtl;



