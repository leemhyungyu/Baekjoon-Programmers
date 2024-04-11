from collections import defaultdict
from collections import deque
import sys

input = sys.stdin.readline
n = int(input())
m = int(input())
array = [list(map(int, input().split())) for _ in range(n)]
plan = list(map(int, input().split()))


def solution(array, n, m, plan):
    routes = defaultdict(list)
    visited = [False for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if array[i][j] == 1:
                routes[i] += [j]

    def bfs(start):
        q = deque([start])
        visited[start] = True
        while q:
            now = q.popleft()

            for i in routes[now]:
                if not visited[i]:
                    q.append(i)
                    visited[i] = True

    bfs(plan[0] - 1)

    for i in plan:
        if not visited[i - 1]:
            return "NO"
        
    return "YES"


print(solution(array, n, m, plan))

