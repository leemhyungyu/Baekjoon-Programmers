a, b, c = map(int, input().split())

count = 0

def compare(a, b, c):
    global count
    
    if a == b:
        count += 1
        same = a
    if a == c:
        count += 1
        same = a
    if b == c:
        count += 1
        same = b
        
    if count == 0:
        print(max(a, b, c) * 100)
    elif count == 1:
        print(1000 + same * 100)
        print(same)
    elif count == 3:
        print(10000 + a * 1000)

compare(a, b, c)
