# 백준 10799번 문제: 쇠막대기 (스택)
n = list(input())
stack = []
result = 0

for i in range(len(n)):
  # 만약 '('이면 스택에 추가
  if n[i] == '(':
    stack.append('(')
  # ')'이면
  else:
    # ')'전 문자가 '('이면 pop해준 후 '('의 개수만큼 결과에 더해줌
    if n[i - 1] == '(':
      stack.pop()
      result += len(stack)
    # ')'전 문자가 ')'이면 pop해준 후 1을 더해줌 
    else:
      stack.pop()
      result += 1

print(result)
