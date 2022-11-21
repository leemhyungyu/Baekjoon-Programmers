# 백준 1874번 문제: 스택 수열

n = int(input())

cnt = 0

stack = []
array = []
print_array = []
for _ in range(n):
  array.append(int(input()))
  
# 제일 위에있는 값이 내가 원하는 값이면 팝, 그렇지 않으면 푸쉬
i = 0
while True:

  if len(stack) != 0:
    if stack[len(stack) - 1] == array[i]:
      print_array.append('-')
      stack.pop()
      i += 1
    elif stack[len(stack) - 1] > array[i]:
      print_array.append("NO")
      break
    else:
      print_array.append('+')
      stack.append(cnt)
      cnt += 1

  else:
    stack.append(cnt)
    cnt += 1
    
  if i == len(array):
    break

if "NO" not in print_array:
  for j in print_array:
    print(j)
else:
  print("NO")
