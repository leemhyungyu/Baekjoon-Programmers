# 백준 17298번 문제: 오큰수(스택)
import sys

input = sys.stdin.readline
n = int(input())

array = list(map(int, input().split()))
stack = []
result = [-1] * n

for i in range(len(array)):
  # 스택이 비어있지 않고 스택의 최상단 값이 array[i]보다 작으면, 즉 오른쪽에 있는 값이 더 크면 반복
  while stack and array[stack[-1]] < array[i]:
    # 해당 스택의 최상단 값인 인덱스의 결과 리스트에 array[i] 저장
    result[stack.pop()] = array[i]
  stack.append(i)

print(*result)
