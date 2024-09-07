def solution(prices):
    stack = []
    answer = [0 for _ in range(len(prices))]

    for i in range(len(prices)):
        now = prices[i]
        
        if len(stack) == 0:
            stack.append((now, i))
            continue 
        
        while len(stack) > 0 and stack[-1][0] > now:
            answer[stack[-1][1]] = i - stack[-1][1]
            stack.pop(-1)
            
        stack.append((now, i))
        
    while stack:
        last = stack.pop(-1)
        answer[last[1]] = len(prices) - last[1] - 1
        
    return answer
