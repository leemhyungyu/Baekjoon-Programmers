def solution(beginning, target):
    rows, cols = len(beginning), len(beginning[0])
    count = 10**9
    
    for row_mask in range(1 << rows):
        row_temp = [row[:] for row in beginning]
        row_count = bin(row_mask).count('1')

        for r in range(rows):
            if row_mask & (1 << r):
                for c in range(cols):
                    row_temp[r][c] = 1 - row_temp[r][c]

        for col_mask in range(1 << cols):
            col_count = bin(col_mask).count('1')
            col_temp = [row[:] for row in row_temp]
            for c in range(cols):
                if col_mask & (1 << c):
                    for r in range(rows):
                        col_temp[r][c] = 1 - col_temp[r][c]

            if col_temp == target:
                count = min(count, row_count + col_count)

    return count if count != 10**9 else -1
