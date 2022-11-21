# 백준 10808번 문제: 알파벳 개수(구현) 

# 알파벳 딕셔너리
alpha = {'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e': 4, 'f': 5, 'g': 6, 'h': 7, 'i': 8, 'j': 9, 'k': 10, 'l': 11, 'm': 12, 'n': 13, 'o': 14, 'p': 15, 'q': 16, 'r': 17, 's': 18, 't': 19, 'u': 20, 'v': 21, 'w': 22, 'x': 23, 'y': 24, 'z': 25}

result = [0 for _ in range(len(alpha))]

s = input()

for i in s:
  result[alpha[i]] += 1

print(*result)
