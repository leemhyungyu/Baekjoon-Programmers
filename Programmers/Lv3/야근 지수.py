import heapq

def solution(n, works):
    answer = 0
    heap = []
    for work in works:
        heapq.heappush(heap, -work)

    while n > 0:
        maxValue = heapq.heappop(heap)
        heapq.heappush(heap, min(maxValue + 1, 0))
        n -= 1

    for i in heap:
        answer += i ** 2
        
    return answer
