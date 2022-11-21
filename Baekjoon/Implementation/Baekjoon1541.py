# 백준 1541번 문제: 잃어버린 괄호 (구현)

# 문자열을 '-'을 기준으로 나눠줌
s = list(input().split('-'))
number = []
cnt = 0

for i in s:
  # 문자열을 '+'를 기준으로 나눠줌
  temp = i.split('+')
  
  sum = 0
  # '+'를 기준으로 나눠준 값을 계산함
  for j in temp:
    sum += int(j)
  # number 리스트에 더한 값을 저장하고 cnt를 1올려줌
  number.append(sum)
  cnt += 1
  
# 결과를 리스트의 첫번째 값으로 설정
result = number[0]

for i in range(1, cnt):
  result -= number[i]

print(result)
