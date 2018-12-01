def knot_hash(string, lengths)
  n = string.length # circular
  skip = 0
  position = 0 # initial position
  
  lengths.each do |length|
    # get elements
    t = (position...position+length).map { |i| string[i%n] }
    t.reverse! # reverse the sub-array
    
    # write back the reversed sub-array to the string
    t.each_with_index { |e,i| string[(position+i)%n] = e }
    
    # update position
    position = (position+length+skip) % n
    
    # increment 
    skip += 1
  end
    
  # product of the first two elements
  string[0] * string[1]
end
