# www.acmicpc.net/problem/9251
# 백준 9251번 문제: LCS

first = input()
second = input()

graph = [[0 for _ in range(len(second) + 1)] for _ in range(len(first) + 1)]

for i in range(len(first)):
  for j in range(len(second)):
    if first[i] == second[j]:
      graph[i + 1][j + 1] = graph[i][j] + 1
    else:
      graph[i + 1][j + 1] = max(graph[i + 1][j], graph[i][j + 1])

print(graph[len(first)][len(second)])
