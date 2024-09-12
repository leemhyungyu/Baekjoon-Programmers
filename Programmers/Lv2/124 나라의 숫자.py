def solution(n):
    result = []
    
    while n:
        if n % 3 == 0:
            result.append("4")
            n -= 1
        else:
            result.append(str(n % 3))
        n //= 3 


    return "".join(reversed(result))
