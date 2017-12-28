def rcv_freq(commands)
  # resolve value
  # (int | reg) -> int
  def resolve(registers, input)
    num = Integer(input) rescue nil
    num ? num : registers[input]
  end
  
  # ---

  i = 0 # program counter (pointer)
  n = commands.size # number of commands
  registers = Hash.new(0) # zero values by default
  freq = nil
  
  loop do
    break if i < 0 || i > (n-1) # outside? -> terminate
    cmd = commands[i] # fetch the command
    
    case cmd
      when /set\s([a-zA-Z]+)\s(.*)/i
        registers[$1] = resolve(registers, $2)
      when /add\s([a-zA-Z]+)\s(.*)/i
        registers[$1] += resolve(registers, $2)
      when /mul\s([a-zA-Z]+)\s(.*)/i
        registers[$1] *= resolve(registers, $2)
      when /mod\s([a-zA-Z]+)\s(.*)/i
        registers[$1] %= resolve(registers, $2)
      when /snd\s([a-zA-Z]+)/i
        # play sound (important)
        freq = registers[$1]
      when /rcv\s([a-zA-Z]+)/i
        return freq if registers[$1] != 0 # must be non-zero
      when /jgz\s([a-zA-Z]+)\s(.*)/i
        if registers[$1] > 0 # must be greater than zero
          i += $2.to_i
          next # immediately go
        end
    end
    
    i += 1 # go to the next command
  end # end loop
  
  freq
end
