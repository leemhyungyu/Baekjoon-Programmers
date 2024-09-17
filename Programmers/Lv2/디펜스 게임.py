import heapq

def solution(n, k, enemy):
    if k >= len(enemy):
        return len(enemy)
    
    heap = []
    
    for i in range(len(enemy)):
        heapq.heappush(heap, enemy[i])
        if len(heap) > k:
            last = heapq.heappop(heap)
            if last > n:
                return i
            n -= last
    
    return len(enemy)
