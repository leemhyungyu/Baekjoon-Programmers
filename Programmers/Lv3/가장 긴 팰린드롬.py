def solution(s):
    answer = 1
    
    for i in range(2, len(s) + 1):
        for j in range(len(s) - i + 1):
            start, end = j, j + i - 1
            if i <= answer: continue
            while start < end:
                if s[start] == s[end]:
                    start += 1
                    end -= 1

                else: break
                
            if start == end or s[start] == s[end]:
                answer = i
            
    return answer
