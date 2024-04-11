from collections import defaultdict
import sys, heapq

input = sys.stdin.readline
n, e = map(int, input().split())
array = [list(map(int, input().split())) for _ in range(e) ]
v1, v2 = map(int, input().split())

def solution(array, n, e, v1, v2):
    graph = defaultdict(dict)

    for i in array:
        graph[i[0]][i[1]] = i[2]
        graph[i[1]][i[0]] = i[2]

    if graph[v1] == {} or graph[v2] == {} or graph[n] == {} :
        return -1
    
    oneCost = dijkstra(graph, 1)
    v1Cost = dijkstra(graph, v1)
    v2Cost = dijkstra(graph, v2)
    
    return min(oneCost[v1] + v1Cost[v2] + v2Cost[n], oneCost[v2] + v2Cost[v1] + v1Cost[n])

def dijkstra(graph, start):
    costs = {i: 1e9 for i in graph}
    costs[start] = 0
    queue = []
    heapq.heappush(queue, [costs[start], start])

    while queue:
        nowCost, nowNode = heapq.heappop(queue)
        if costs[nowNode] < nowCost:
            continue
        for newNode, newCost in graph[nowNode].items():
            cost = newCost + nowCost
            if cost < costs[newNode]:
                costs[newNode] = cost
                heapq.heappush(queue, [cost, newNode])
    
    return costs                               
    
print(solution(array, n, e, v1, v2))

