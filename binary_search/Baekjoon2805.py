import sys
# 변수의 범위가 크기 때문에 sys라이브러리 사용
n, m = map(int, sys.stdin.readline().split())
array = list(map(int, sys.stdin.readline().split()))

# 시작점과 끝점
start = 0
end = max(array) 

# 결과 높이를 저장하는 변수
result = 0

while(start <= end):
  # 가져가고자하는 값과 비교할 변수
  total = 0 

  # 중간점
  mid = (start + end) // 2
  
  for x in array:
    # 배열의 원소가 중간점보다 클때만 계산
    if x > mid:
      total += x - mid
      # 합이 m보다 큰 경우 더이상 계산 중지
      if total > m:
        break
  # 합이 m보다 작은 경우
  if total < m:
    end = mid - 1
  # 합이 m보다 크거나 같은 경우
  else:
    result = mid
    start = mid + 1

print(result)
