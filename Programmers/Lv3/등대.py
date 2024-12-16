import sys
sys.setrecursionlimit(100000)

def solution(n, lighthouse):
    graph = [[] for _ in range(n + 1)]
    visited = [False for _ in range(n + 1)]
    d = [[0, 0] for _ in range(n + 1)]
    answer = 0
    
    for i in lighthouse:
        graph[i[0]] += [i[1]]
        graph[i[1]] += [i[0]]
        
    def dfs(node):
        visited[node] = True
        d[node][1] = 1
        
        for i in [c for c in graph[node] if not visited[c]]:
            dfs(i)
            d[node][0] += d[i][1]
            d[node][1] += min(d[i][0], d[i][1])
    
    dfs(1)
    
    return min(d[1][0], d[1][1])
