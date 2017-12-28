VECTORS = [[1,0], [0,1], [-1,0], [0,-1]] # move-vectors

def spiral_distance(n)
  c = 1 # number counter
  u = [0,0] # target coordinate
  h = { [0,0] => true } # visited 'points'
  b = false
  ov = VECTORS[0] # old vector
  
  return 0 if n <= 1
  
  VECTORS.cycle do |v|
    if v != ov
      while h[[u[0]+v[0], u[1]+v[1]]]
        # apply the vector
        u[0] += ov[0]
        u[1] += ov[1]
        h[u.dup] = true
        c += 1
        
        if c == n
          b = true
          break
        end
      end
    end
    
    break if b

    u[0] += v[0]
    u[1] += v[1]
    h[u.dup] = true # visited
    c += 1
    
    break if c == n
    ov = v.dup # old move
  end

  u[0].abs + u[1].abs
end
