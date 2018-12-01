def spinlock(step)
  pos = 0
  buffer = [0]
  length = 1
  value = 1
  
  2017.times do
    m = (pos + step) % length
    pos = m+1 # next
    buffer.insert(pos, value)
    value += 1
    length += 1
  end
  
  buffer[pos+1]
end
