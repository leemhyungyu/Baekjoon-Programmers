# www.acmicpc.net/problem/22351
# 백준 22351번 문제: 수학은 체육과목 입니다 3

s = input()

one = ""
two = ""
three = ""

first = []
end = []

first.append(int(s[0]))

temp = int(s[0])

while len(one) < len(s):

  one += str(temp)
  temp += 1

end.append(temp - 1)

if len(s) > 1:
  first.append(int(s[0] + s[1]))
  
  temp = int(s[0] + s[1])
  
  while len(two) < len(s):
    
    two += str(temp)
    temp += 1
  
  end.append(temp - 1)

if len(s) > 2:
  first.append(int(s[0] + s[1] + s[2]))
  
  temp = int(s[0] + s[1] + s[2])
  
  
  while len(three) < len(s):
    three += str(temp)
    temp += 1
  
  end.append(temp - 1)

if one == s:
  print(first[0], end[0])

elif two == s:
  print(first[1], end[1])

elif three == s:
  print(first[2], end[2])
