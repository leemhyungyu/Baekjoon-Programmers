from collections import deque

def solution(n, s, a, b, fares):
    graph = [[] for _ in range(n)]
    answer = 200 * 100001
    
    for fare in fares:
        graph[fare[0] - 1] += [(fare[1] - 1, fare[2])]
        graph[fare[1] - 1] += [(fare[0] - 1, fare[2])]
    
    costs = dijkstra(s - 1, n, graph)
    
    for i in range(0, n):
        newCosts = dijkstra(i, n, graph)
        answer = min(answer, costs[i] + newCosts[a - 1] + newCosts[b - 1])
        
    return answer

def dijkstra(start, n, graph):
    costs = [200 * 100001 for _ in range(n)]
    costs[start] = 0
    q = deque()
    q.append((start, 0))
    
    while q:
        node, cost = q.popleft()
        
        if costs[node] < cost: continue
        
        for i in graph[node]:
            nextNode, nextCost = i[0], i[1]
            
            if costs[nextNode] > nextCost + cost:
                costs[nextNode] = nextCost + cost
                q.append((nextNode, nextCost + cost))
    
    return costs
