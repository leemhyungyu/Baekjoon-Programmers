def binary_search(array, target, start, end):
  # 찾기 못한 경우 0 반환
  if start > end:
    return 0

  mid = (start + end) // 2
  # 중간점의 값과 찾는 값이 같은 경우 1 반환
  if array[mid] == target:
    return 1

  # 중간의 값이 타켓보다 작을 경우 중간점 ~ 끝점 탐색
  elif array[mid] < target:
    return binary_search(array, target, mid + 1, end)

  # 중간점의 값이 타켓보다 클 경우
  else:
    return binary_search(array, target, start, mid - 1)

n = int(input())
array = list(map(int, input().split()))
m = int(input())
x = list(map(int, input().split()))

start = 0
end = n

array.sort()

for x in x:
    print(binary_search(array, x, start, end - 1), end = ' ')
