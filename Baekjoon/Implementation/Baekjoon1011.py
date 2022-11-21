# 백준 1011번 문제: Fly me to the Alpha Centauri
t = int(input())

for _ in range(t):
    x, y = map(int,input().split())
    distance = y - x
    count = 0
    move = 1
    move_plus = 0 
    while move_plus < distance :
        count += 1
        move_plus += move
        if count % 2 == 0 : 
            move += 1  
    print(count)
