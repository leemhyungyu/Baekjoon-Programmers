# 백준 9012번 문제: 괄호
t = int(input())

for _ in range(t):
  count = 0
  array = list(input())

  for i in array:
    if i == '(':
      count += 1
    else:
      count -= 1
      if count < 0:
        print("NO")
        break

  if count > 0:
    print("NO")
  elif count == 0:
    print("YES")
