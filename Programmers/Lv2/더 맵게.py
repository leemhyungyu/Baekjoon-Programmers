import heapq

def solution(scoville, K):
    heap = scoville
    heapq.heapify(heap)
    count = 0
    while heap[0] < K:
        if len(heap) <= 1 and heap[0] < K: return -1
        one = heapq.heappop(heap)
        two = heapq.heappop(heap)
        new = one + two * 2
        heapq.heappush(heap, new)
        count += 1
    
    return count
