def solution(k, ranges):
    answer = []        
    sequence = collatz(k)
    n = len(sequence) - 1
    area = calculateArea(n, sequence)
        
    for i in ranges:
        a = i[0]
        b = n + i[1]
        answer.append(calculateIntegral(a, b, area))

    return answer

def collatz(k):
    sequence = [k]
    while k > 1:
        if k % 2 == 0:
            k //= 2
        else:
            k = k * 3 + 1
        sequence.append(k)
    return sequence

def calculateArea(n, sequence):
    area = [0 for _ in range(n + 1)]
    for i in range(n):
        area[i + 1] = area[i] + (sequence[i] + sequence[i + 1]) / 2
    return area

def calculateIntegral(a, b, area):
    if a > b: return -1.0
    return area[b] - area[a]
