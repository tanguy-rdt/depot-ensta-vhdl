
Instruction=Struct.new(:opcode,:arg) do
  def to_s
    "#{opcode} #{arg}"
  end
end

OPCODES=[:halt,:set,:load,:store,:add,:sub,:mul,:div,:jumpz,:jump,:receive,:send]
REGEXP_OPCODES="#{OPCODES.map(&:to_s).join('|')}"

@labels={}
def parse filename
  puts "=> parsing '#{filename}'"
  instr_addr=0
  IO.readlines(filename).map.with_index do |line,idx|
    line.chomp!
    unless line.start_with? (/\#/) or line.empty?
      if md=line.match(/\s*(?<label>.*)\:(?<rest>.*)(?<comment>\s*\#.*)?/)
        @labels[md[:label]]=instr_addr
        line=md[:rest]
      end
      if md=line.match(/\s*(?<opcode>#{REGEXP_OPCODES})\s*(?<arg>\w+)?(?<comment>\s*\#.*)?/)
        instr_addr+=1
        arg = md[:arg]=="" ? "0" : md[:arg]
        Instruction.new(md[:opcode],arg)
      end
    end
  end.compact
end

def gen_bin instructions
  puts "=> generate binary"
  @asm_of={}
  instructions.map do |instr|
    opc=instr.opcode.to_sym
    val=instr.arg
    binop=OPCODES.index opc
    case opc
    when :jump,:jumpz
      case val
      when /\d+/
        binval=val.to_i
      else
        binval=@labels[val]
      end
    else
      binval=val.to_i
    end
    #p [binop,binval]
    bin=((binop & 0xF)<<12) + (binval & 0xFFF)
    @asm_of[bin]=instr.to_s
    bin
  end
end

def gen_vhdl_rom binary
  ary = []
  ary << "library ieee;"
  ary << "use ieee.std_logic_1164.all;"
  ary << "use ieee.numeric_std.all;"
  ary << ""
  ary << "library hypo_lib;"
  ary << "use hypo_lib.core_pkg.all;"
  ary << ""
  ary << "package rom_pkg is"
  ary << "  constant ROM : code_memory_type :=("
  binary.each_with_index do |bin,idx|
    ary << "    #{idx} => x\""+bin.to_s(16).rjust(4,'0')+"\","+"--#{@asm_of[bin].to_s}"
  end
  ary << "    others => x\"0000\""
  ary << "  );"
  ary << "end rom_pkg;"
  txt=ary.join("\n")
  File.open(filename="../hdl/rom_pkg.vhd",'w'){|f| f.puts txt}
  #puts txt
  puts "[+] file '#{filename} generated"
end

filename=ARGV.first
instructions=parse(filename)
bin_instrs=gen_bin(instructions)
gen_vhdl_rom(bin_instrs)
