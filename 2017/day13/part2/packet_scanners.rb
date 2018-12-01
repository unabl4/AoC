# triangle wave
# taken from the 'toAndFrom' codefights challenge (https://codefights.com/challenge/WEtqMW2BXykpGw7fK)
def position(from=0, to, t)
  p = (to-from).abs # period
  (((t-p) % (2*p))-p).abs+[from,to].min
end

def delay(firewall)
  d = 0 # delay
  
  loop do
    break if firewall.all? { |k,v| position(0, v-1, k+d) > 0 } # must not be zero
    d += 1
  end
  
  d
end

def parse(input)
  input.split("\n").map { |x| x.split(": ").map(&:to_i) }.to_h
end

# ---

i = "0: 3
1: 2
2: 4
4: 6
6: 4
8: 6
10: 5
12: 8
14: 8
16: 6
18: 8
20: 6
22: 10
24: 8
26: 12
28: 12
30: 8
32: 12
34: 8
36: 14
38: 12
40: 18
42: 12
44: 12
46: 9
48: 14
50: 18
52: 10
54: 14
56: 12
58: 12
60: 14
64: 14
68: 12
70: 17
72: 14
74: 12
76: 14
78: 14
82: 14
84: 14
94: 14
96: 14"
