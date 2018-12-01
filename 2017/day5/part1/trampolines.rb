# returns the count of escape jumps
def jump(list)
  n = list.size
  i = 0 # initial
  c = 0 # jump counter
  
  loop do
    p = i # previous
    i += list[i]
    list[p] += 1
    c += 1 # +1 step
    
    # check if outside
    break if i > n-1 || i < 0
  end
  
  c # return the number of jumps
end
