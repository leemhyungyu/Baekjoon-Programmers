# www.acmicpc.net/problem/23842
# 백준 23842번 문제: 성냥개비

n = int(input())
array = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6] # 0 ~ 9까지 사용하는 성냥의 갯수
resultArray = []

n = n - 4

for i in range(len(array)):
  for j in range(len(array)):
    for k in range(len(array)):
      for z in range(len(array)):
        for q in range(len(array)):
          for w in range(len(array)):

            temp = array[i] + array[j] + array[k] + array[z] + array[q] + array[w]
            if (i * 10 + j) + (k * 10 + z) == (q * 10 + w) and temp == n:
              print(str(i) + str(j) + "+" + str(k) + str(z) + "=" + str(q) + str(w))
              exit()
            
print("impossible")
