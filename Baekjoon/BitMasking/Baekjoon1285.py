n = int(input())
array = []
for _ in range(n):
    array.append(list(input()))

def solution(array, n):
    answer = n * n

    for row in range(1 << n):
        row_temp = [i[:] for i in array]
        for i in range(n):
            if row & (1 << i):
                for j in range(n):
                    row_temp[j][i] = ('H' if row_temp[j][i] == 'T' else 'T')
        
        front_count = 0
        for i in range(n):
            col_count = 0
            for j in range(n):
                if row_temp[i][j] == 'T': col_count += 1
            front_count += min(n - col_count, col_count)

        answer = min(answer, front_count)
    return answer

print(solution(array, n))
                      
