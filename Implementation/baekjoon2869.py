# 백준 2869번 문제: 달팽이는 올라가고 싶다
A, B, V = map(int, input().split())
 
high = V - A
if high % (A-B) == 0:
    first = int(high/(A-B))
else:
    first = int(high/(A-B) + 1)
print(first + 1)
