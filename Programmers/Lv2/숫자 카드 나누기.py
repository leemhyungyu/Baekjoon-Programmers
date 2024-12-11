from math import gcd

def solution(arrayA, arrayB):
    answer = 0
    a = find(arrayA)
    b = find(arrayB)
    answer = max(condition(arrayB, a), condition(arrayA, b))
    return answer

def condition(array, num):
    if num == 1: return 0
    for i in array:
        if i % num == 0: return 0
    return num
    
def find(array):
    result = array[0]
    for i in array: result = gcd(result, i)
    return result
