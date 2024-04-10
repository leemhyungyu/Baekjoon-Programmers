from collections import deque
import sys, heapq
input = sys.stdin.readline

n = int(input())
array = [list(map(int, input().split())) for _ in range(n)]

def solution(array, n):
    array.sort()
    h = []
    
    for i in array:
        if h and h[0] <= i[0]:
            heapq.heappop(h)
        heapq.heappush(h, i[1])
        print(h)
    
    return len(h)

print(solution(array, n))
