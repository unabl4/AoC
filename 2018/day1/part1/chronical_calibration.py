f = open("input.txt", "r")
i = f.read() # nums
f.close()
g = [int(n) for n in i.split('\n')[:-1]]
print(sum(g))
