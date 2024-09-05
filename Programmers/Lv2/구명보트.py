def solution(people, limit):
    result = 0
    left = 0
    right = len(people) - 1
    
    people.sort()
    
    while left <= right:
        result += 1
        if people[left] + people[right] <= limit:
            left += 1
            right -= 1
            continue
        
        right -= 1
        
    return result
