# find zero
def spinlock_zero(step)
  pos = 0
  buffer = [0]
  length = 1
  value = 1
  after_zero = nil # value after zero
  
  50e6.to_i.times do
    m = (pos+step) % length
    pos = m+1 # next
    after_zero = value if buffer[m] == 0
    # buffer.insert(pos,value)
    value += 1
    length += 1
  end

  # value after zero
  after_zero
end
