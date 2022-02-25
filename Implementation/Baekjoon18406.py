# 백준 18406번 문제: 럭키 스트레이트 (구현)
score = list(input())

left = []
right = []

for i in range(len(score) // 2):
  left.append(score[i])

for i in range(len(score) // 2, len(score)):
  right.append(score[i])

calculate_left = 0
calculate_right = 0

for i in left:
  calculate_left += int(i)

for i in right:
  calculate_right += int(i)

if calculate_left == calculate_right:
  print("LUCKY")
else:
  print("READY")
