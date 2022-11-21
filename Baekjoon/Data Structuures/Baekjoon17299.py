# 백준 17299번 문제: 오등큰수
n = int(input())

array = list(map(int, input().split()))
result = [-1 for _ in range(n)] # 결과값을 저장할 리스트
count = [0 for _ in range(1000001)] # 등장한 횟수를 저장하는 리스트
stack = [] # 인덱스를 저장할 스택

# 입력받은 수열의 등장횟수를 저장

for i in array:
  count[i] += 1
  
for i in range(len(array)):

  # 만약 스택 비어있지 않고, 스택의 젤 상단의 값인 인덱스의 등장한 횟수의 값이 오른쪽 값의 등장횟수보다 작으면 
  while stack and count[array[stack[-1]]] < count[array[i]]:
    result[stack[-1]] = array[i]
    stack.pop()
    
  stack.append(i)

print(*result)
