def mul_count(commands)
  def resolve(registers,input)
    v = Integer(input) rescue nil
    v || registers[input]
  end

  # ---
  
  n = commands.size
  mul = 0 # number of 'mul' calls
  pc = 0 # program counter (pointer)
  registers = Hash.new(0)
  
  loop do
    break if pc < 0 || pc > (n-1)
    cmd = commands[pc]
    
    case cmd
      when /set\s([a-z])\s(.+)/i
        registers[$1] = resolve(registers,$2)
      when /sub\s([a-z])\s(.+)/i
        registers[$1] -= resolve(registers,$2)
      when /mul\s([a-z])\s(.+)/i
        registers[$1] *= resolve(registers,$2)
        mul += 1
      when /jnz\s(.+)\s(-?\d+)/i
        if resolve(registers,$1) != 0
          pc += $2.to_i
          next # custom jump (goto)
        end
    end
    
    pc += 1
  end
  
  mul
end
