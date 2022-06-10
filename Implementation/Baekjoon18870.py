# www.acmicpc.net/problem/18870
# 백준 18870번 문제: 좌표 압축
import sys

n = int(input())
array = list(map(int, input().split()))

count = {}

temp = set(array)
a = list(temp)
a.sort()

for i in range(len(a)):
  count[a[i]] = i

for i in range(len(array)):
  print(count[array[i]], end = " ")
