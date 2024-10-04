import heapq

def solution(jobs):
    heap = []
    start = -1 # 현재 작업의 시작 시간.
    end = 0 # 현재 작업의 완료 시간.
    count = 0 # 완료한 작업의 개수
    answer = 0

    while count != len(jobs):
        for job in jobs:
            if start < job[0] <= end:
                heapq.heappush(heap, [job[1], job[0]])
        
        if heap:
            now = heapq.heappop(heap)
            start = end
            end += now[0]
            answer += end - now[1]
            count += 1
        else:
            end += 1
    
        
    return answer // len(jobs)
