def redistribution_size(banks)
  h = Hash.new(0)
  b = banks.dup # copy
  n = banks.size # number of banks
  s = nil # state
  z = 1
  
  loop do
    # first - select the bank with the most blocks
    v = b.max # max value (number of blocks)
    i = b.index(v) # bank index

    b[i] = 0 # reset count
  
    # redistribute  
    loop do
      break if v <= 0 # stop if nothing left to redistribute
      i = (i+1) % n  # start from the next bank in the list
      b[i] += 1 # add 1 to the bank
      v -= 1 # decrement 
    end

    
    if h[b]
      if s # state recorded
        if s == b
          return z
        else
          z += 1
        end
      else
        s = b.dup
      end
    else
      h[b] = true
    end
    
    
  end
  
  c
end
