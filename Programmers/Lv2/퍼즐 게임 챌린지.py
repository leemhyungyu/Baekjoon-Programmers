def solution(diffs, times, limit):
    
    start = min(diffs)
    end = max(diffs)
    answer = 0
    
    while start <= end:
        mid = (start + end) // 2
        time = 0
        for i in range(len(diffs)):
            time += calculateTime(diffs, times, mid, i)
        
        if time > limit:
            start = mid + 1
        else:
            answer = mid
            end = mid - 1
        
    return answer


def calculateTime(diffs, times, level, index):
    if diffs[index] <= level: return times[index]
    else: return (diffs[index] - level) * (times[index - 1] + times[index]) + times[index]
    
