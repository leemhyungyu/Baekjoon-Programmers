# 백준 1453번 문제: 피시방 알바
n = int(input())

chair = []
count = 0
guest = list(map(int, input().split()))

# 손님이 원하는 자리를 하나씩 탐색
for i in guest:
  # 만약 손님이 원하는 자리가 비어있다면 chair리스트에 추가
  if i not in chair:
    chair.append(i)
  # 손님이 원하는 자리가 차있다면
  else:
    count += 1

print(count)
  
