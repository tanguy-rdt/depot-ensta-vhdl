library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library hypo_lib;

package core_pkg is
  constant CODE_MEM_NBITS : natural := 8;
  constant DATA_MEM_NBITS : natural := 8;

  constant OP_HALT    : std_logic_vector(3 downto 0) :="0000";
  constant OP_SET     : std_logic_vector(3 downto 0) :="0001";
  constant OP_LOAD    : std_logic_vector(3 downto 0) :="0010";
  constant OP_STORE   : std_logic_vector(3 downto 0) :="0011";
  constant OP_ADD     : std_logic_vector(3 downto 0) :="0100";
  constant OP_SUB     : std_logic_vector(3 downto 0) :="0101";
  constant OP_MUL     : std_logic_vector(3 downto 0) :="0110";
  constant OP_DIV     : std_logic_vector(3 downto 0) :="0111";
  constant OP_JMPZ    : std_logic_vector(3 downto 0) :="1000";
  constant OP_JMP     : std_logic_vector(3 downto 0) :="1001";
  constant OP_RECEIVE : std_logic_vector(3 downto 0) :="1010";
  constant OP_SEND    : std_logic_vector(3 downto 0) :="1011";
  -- INFO for LEDS/DEBUG
  constant BIT_IDLE           : natural := 0;
  constant BIT_DECODE_EXEC    : natural := 1;
  constant BIT_SEND_BYTE_L    : natural := 2;
  constant BIT_SEND_BYTE_H    : natural := 3;
  constant BIT_RECEIVE_BYTE_L : natural := 4;
  constant BIT_RECEIVE_BYTE_H : natural := 5;
  constant BIT_HALTED         : natural := 7;
  -- to display name of opcode during simulation
  type op_name_t is (HALT,SET,LOADL,STORE,ADD,SUB,MUL,DIV,JMP,JMPZ,RECEIVE,SEND);

  function get_name(opcode : std_logic_vector(3 downto 0)) return op_name_t;
  --
  type code_memory_type is array(0 to 2**CODE_MEM_NBITS-1) of std_logic_vector(15 downto 0);

  -- warning ! This will no infer a BRAM but registers
  --          , that can be read asynchronously (no clock cycles)!
  type data_memory_type is array(0 to 2**DATA_MEM_NBITS-1) of std_logic_vector(15 downto 0);

end package;

package body core_pkg is
  function get_name(opcode : std_logic_vector(3 downto 0)) return op_name_t is
  begin
    return op_name_t'val(to_integer(unsigned(opcode)));
  end function get_name;
end package body;
