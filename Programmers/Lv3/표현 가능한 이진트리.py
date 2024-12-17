def search(numbers):
    length = len(numbers)
    if length == 1 or '1' not in numbers or '0' not in numbers: return True
    mid = length // 2
    if numbers[mid] == '0': return False
    return search(numbers[:mid]) and search(numbers[mid + 1:])
    
def solution(numbers):
    node_count = [(2 ** x) - 1 for x in range(1, 50)]
    answer = []
    
    for number in numbers:
        bin_number = [num for num in bin(number)][2:]
        
        for i in node_count:
            if len(bin_number) <= i:
                bin_number = ['0'] * (i - len(bin_number)) + bin_number
                break
                
        answer.append(1 if search(bin_number) else 0)
    return answer

