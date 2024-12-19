import sys
from sys import stdin

sys.setrecursionlimit(10**9)
input = stdin.readline

n = int(input())
graph = [[] for _ in range(n + 1)]

for i in range(n - 1):
    a, b = map(int, input().split())
    graph[a] += [b]
    graph[b] += [a]
    
def solution(n, graph):
    d = [[0, 0] for _ in range(n + 1)]
    visited = [False for _ in range(n + 1)]
    
    def dfs(node):
        visited[node] = True
        d[node][1] = 1
        
        for i in [n for n in graph[node] if not visited[n]]:
            dfs(i)
            d[node][0] += d[i][1]
            d[node][1] += min(d[i][0], d[i][1])

    dfs(1)
        
    return min(d[1][0], d[1][1])

print(solution(n, graph))
