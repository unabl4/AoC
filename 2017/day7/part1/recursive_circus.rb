class Node 
  attr_accessor :name, :prev
  
  def initialize(name, weight)
    @name = name
    @weight = weight
  end
end # node

# ---

REGEXP = /([a-z]+) \((\d+)\)/.freeze

# recursive circus
def find_bottom(input)
  nodes = {}
  i = input.split("\n")
  
  # step 1: declare individual nodes
  i.each do |x|
    m = REGEXP.match(x.split('->')[0])
    nodes[m[1]] = Node.new(m[1],m[2].to_i)
  end
  
  # step 2: set relations between nodes
  i.each do |x|
    t = x.split(' -> ')
    next unless t[1]
    
    m = REGEXP.match(t[0])
    t[1].split(', ').each do |v|
      nodes[v].prev = nodes[m[1]]
    end
  end
  
  # step 3: track back
  r = nodes.values.sample # random
  while r.prev do
    r = r.prev
  end
    
  # return
  r
end
