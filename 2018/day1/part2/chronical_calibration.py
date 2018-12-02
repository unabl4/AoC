f = open("input.txt", "r")
i = f.read() # nums
f.close()
g = [int(n) for n in i.split('\n')[:-1]]
s = set([0]) # freq set
z = 0 # freq sum
i = 0 # current frequency
while True:
  z += g[i]
  if z in s:
    print(z)
    break # found it stop
  else:
    s.add(z)

  i = (i+1) % len(g)
