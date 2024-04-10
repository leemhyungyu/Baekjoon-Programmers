import sys, math
input = sys.stdin.readline
n, s = map(int, input().split())
array = list(map(int, input().split()))

def solution(array, n, s):
    left, right = 0, 0
    result = 1e9
    
    sum = array[left]
    
    while left <= right:
        if sum < s:
            right += 1
            if right >= n: break
            sum += array[right]
        else:
            result = min(right - left + 1, result)
            sum -= array[left]
            left += 1

    if result == 1e9:
        return 0
    else:
        return result
            
        
print(solution(array, n, s))
