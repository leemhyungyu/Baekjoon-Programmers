# www.acmicpc.net/problem/10820
# 백준 10820번: 문자열 분석

while True:

  try:
    upper = 0
    lower = 0
    integer = 0
    void = 0
    
    inputData = list(input())
    
    for i in inputData:
      if i.isupper():
        upper += 1
      elif i.islower():
        lower += 1
      elif i == ' ':
        void += 1
      else:
        integer += 1
        
    print(lower, upper, integer, void)
  except EOFError:
    break
  
