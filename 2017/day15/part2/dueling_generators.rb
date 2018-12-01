def generator(start, factor, div)
  Enumerator.new do |y| # y - yielder
    m = 2147483647 # modulo
    v = start
    
    # endless part
    loop do
      # find the next suitable value
      begin
        v = (v*factor) % m 
      end while (v % div) != 0
      
      y << v # finally, yield the value
    end
  end # enum
end

# get number of pairs
def pairs()
  g1 = generator(512, 16807, 4) # 65 / 512
  g2 = generator(191, 48271, 8) # 8921 / 191
  
  total = 0
  5e6.to_i.times do
    v1 = g1.next.to_s(2).rjust(16,'0')
    v2 = g2.next.to_s(2).rjust(16,'0')
    
    total += 1 if v1[-16,16] == v2[-16,16]
  end
  
  total
end
