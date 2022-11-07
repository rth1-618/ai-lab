from itertools import combinations, permutations

def replacements(): 
    for comb in combinations(range(10), 8): 
        for perm in permutations(comb): 
            if perm[0] * perm[1] != 0: 
                yield dict(zip('SMENDORY', perm))

a, b, c = 'SEND', 'MORE', 'MONEY'

for replacement in replacements(): 
    f = lambda x: sum(replacement[e] * 10**i for i, e in enumerate(x[::-1])) 
    if f(a) + f(b) == f(c):
        print('  {}'.format(f(a)))
        print('+{}'.format(f(b)))
        print('______')
        print(f(c))

# def solutions():
#     # letters = ('s', 'e', 'n', 'd', 'm', 'o', 'r', 'y')
#     all_solutions = list()
#     for s in range(9, -1, -1):
#         for e in range(9, -1, -1):
#             for n in range(9, -1, -1):
#                 for d in range(9, -1, -1):
#                     for m in range(9, 0, -1):
#                         for o in range(9, -1, -1):
#                             for r in range(9, -1, -1):
#                                 for y in range(9, -1, -1):
#                                     if len(set([s, e, n, d, m, o, r, y])) == 8:
#                                         send = 1000 * s + 100 * e + 10 * n + d
#                                         more = 1000 * m + 100 * o + 10 * r + e
#                                         money = 10000 * m + 1000 * o + 100 * n + 10 * e + y

#                                         if send + more == money:
#                                             all_solutions.append((send, more, money))
#     return all_solutions

# print(solutions())