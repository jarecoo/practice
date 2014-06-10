p=[0.2, 0.2, 0.2, 0.2, 0.2]
world=['green', 'red', 'red', 'green', 'green']
Z = 'red'
pHit = 0.6
pMiss = 0.2

def sense(p, Z):
    return [calculate_probability(p, i, Z) for i in range(len(p))]

def calculate_probability(p, i, Z):
    starting_probability = p[i]
    if Z == world[i]:
        return pHit * starting_probability
    else:
        return pMiss * starting_probability

print sense(p,Z)

#normalizing probability
p=[0.2, 0.2, 0.2, 0.2, 0.2]
world=['green', 'red', 'red', 'green', 'green']
Z = 'red'
pHit = 0.6
pMiss = 0.2

def sense(p, Z):
    q=[]
    for i in range(len(p)):
        hit = (Z == world[i])
        q.append(p[i] * (hit * pHit + (1-hit) * pMiss))
    total = sum(q)
    q = [q[i]/total for i in range(len(q))]
    return q
    

print sense(p,Z)