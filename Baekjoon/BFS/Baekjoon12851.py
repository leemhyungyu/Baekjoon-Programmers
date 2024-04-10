from collections import deque
import sys
input = sys.stdin.readline
n, k = map(int, input().split())

# O(N) or O(2N) or O(NLogN)
def solution(n, k):
    route = [0 for _ in range(100001)]
    
    def bfs(x):
        result, count = 0, 0
        queue = deque()
        queue.append(x)

        while queue:
            now = queue.popleft()
            time = route[now]
            dx = [now + 1, now - 1, now * 2]

            if now == k:
                result = time
                count += 1
                continue

            for nx in dx:
                if 0 <= nx < 100001 and (route[nx] == 0 or route[nx] == route[now] + 1):
                    route[nx] = route[now] + 1
                    queue.append(nx)
        return result, count

    result, count = bfs(n)
    print(result)
    print(count)

solution(n, k)
