def solution(phone_book):
    map = set(phone_book)
    
    for numbers in phone_book:
        for i in range(len(numbers)):
            if numbers[:i] in map and numbers[:i] != numbers:
                return False
    
    return True
