# www.acmicpc.net/problem/2609
# 백준 2609번 문제: 최대공약수와 최소공배수

import math

a, b = map(int, input().split())

print(math.gcd(a, b))
print(math.lcm(a, b))
