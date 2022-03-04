#백준 1339번 문제: 단어 수학
t = int(input())

ss = []

for _ in range(t):
    ss.append(input())

alphabet = [0 for i in range(26)]

for s in ss:
    i = 0
    while s:
        now = s[-1]
        alphabet[ord(now) - ord('A')] += pow(10, i)
        i += 1
        s = s[:-1]

alphabet.sort(reverse=True)
ans = 0
for i in range(9, 0, -1):
    ans += i * alphabet[9 - i]
print(ans)
