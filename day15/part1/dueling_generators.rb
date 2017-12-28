def generator(start, factor)
  Enumerator.new do |y| # y - yielder
    m = 2147483647 # modulo
    v = start
    y << v # the very first value
    
    # endless part
    loop do
      v = (v*factor) % m # next value
      y << v # yield the value
    end
  end # enum
# end

# # ---

# class Generator
#   def initialize(start, factor)
#     @start  = start
#     @factor = factor
#     @value  = start
#   end
  
#   def next
#     v = @value
#     @value = (@value * @factor) % 2147483647
#     v
#   end
# end

# get number of pairs
def pairs()
  g1 = generator(512, 16807) # 65 
  g2 = generator(191, 48271) # 191
  
  total = 0
  40e6.to_i.times do 
    v1 = g1.next.to_s(2).rjust(16,'0')
    v2 = g2.next.to_s(2).rjust(16,'0')
    
    total += 1 if v1[-16,16] == v2[-16,16]
  end
  
  total
end
