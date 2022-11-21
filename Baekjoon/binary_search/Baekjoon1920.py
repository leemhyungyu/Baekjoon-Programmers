def binary_search(array, target, start, end):
  if start > end:
    return 0

  mid = (start + end) // 2

  # 찾으려는 값과 중간점의 값이 같은 경우  
  if array[mid] == target:
    return 1
  # 중간점의 값이 찾으려는 값보다 큰 경우
  elif array[mid] > target:
    # 시작점 ~ 중간점구간 재탐색
    return binary_search(array, target, start, mid - 1)
  # 중간점의 값이 찾으려는 값보다 작은 경우
  else:
    # 중간점 ~ 끝점구간 재탐색
    return binary_search(array, target, mid + 1, end)
    

n = int(input())

array = list(map(int, input().split()))

m = int(input())

x = list(map(int, input().split()))


array.sort()

for x in x:
  print(binary_search(array, x, 0, len(array) - 1))

