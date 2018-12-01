def redistribution_count(banks)
  h = {}
  c = 1 # number of redistribtions
  b = banks.dup # copy
  n = banks.size # number of banks
  
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
      return c
    else
      c += 1 # increment the counter
      h[b] = 1
    end
  end
  
  c
end
