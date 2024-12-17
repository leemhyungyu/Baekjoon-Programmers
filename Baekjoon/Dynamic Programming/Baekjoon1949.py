import sys
sys.setrecursionlimit(100000)

n = int(input())
people = list(map(int, input().split()))
graph = [[] for _ in range(n + 1)]

for _ in range(n - 1):
    a, b = map(int, input().split())
    graph[a] += [b]
    graph[b] += [a]
    
def solution(n, people, graph):
    d = [[0, 0] for _ in range(n + 1)]
    visited = [False for _ in range(n + 1)]   
    
    def dfs(node):
        d[node][1] = people[node - 1] 
        visited[node] = True
        
        for i in [n for n in graph[node] if not visited[n]]:
            dfs(i)
            d[node][1] += d[i][0]
            d[node][0] += max(d[i][0], d[i][1])

    dfs(1)
    return max(d[1][0], d[1][1])

print(solution(n, people, graph))
