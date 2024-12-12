import heapq

def solution(k, n, reqs):
    leftN = n - k # 유형 선택하지 않은 남은 상담원 수
    call = [1 for _ in range(k)]
    answer = 10000000001
    
    # 각 유형마다 참가자들이 기다리는 시간 리턴.
    def calculate(call):
        waiting = [0 for _ in range(k)]
        for i in range(k):
            heap = []
            for start, during, type in reqs:
                if type != i + 1: continue
                if len(heap) < call[i]:
                    heapq.heappush(heap, start + during)
                else:
                    least = heapq.heappop(heap)
                    waiting[i] += max(0, least - start)
                    heapq.heappush(heap, max(start, least) + during)        
        return waiting

    while leftN:
        before = calculate(call)
        tempCall = call[:]
        for i in range(k): tempCall[i] += 1
        after = calculate(tempCall)
        maxDiff, maxType = 0, 0        
        for i in range(k):
            if maxDiff <= before[i] - after[i]:
                maxType = i
                maxDiff = before[i] - after[i]
            
        call[maxType] += 1
        leftN -= 1
    
    return sum(calculate(call))
