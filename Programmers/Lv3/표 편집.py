def solution(n, k, cmd):
    answer = ["O"] * n
    prev = {i: i - 1 for i in range(n)}
    next = {i: i + 1 for i in range(n)}
    prev[0], next[n - 1] = None, None
    delete = []
    
    for i in cmd:
        if i[0] == "U":
            x = int(i[2:])
            for _ in range(x):
                k = prev[k]
        elif i[0] == "D":
            x = int(i[2:])
            for _ in range(x):
                k = next[k]
        elif i[0] == "C":
            delete.append(k)
            next_node = next[k]
            prev_node = prev[k]
            answer[k] = "X" 
            if next_node is not None:
                prev[next_node] = prev_node
            if prev_node is not None:
                next[prev_node] = next_node
            k = next_node if next_node is not None else prev_node
        else:
            index = delete.pop()
            next_node = next[index]
            prev_node = prev[index]
            answer[index] = "O"
            if next_node is not None:
                prev[next_node] = index
            if prev_node is not None:
                next[prev_node] = index
    return "".join(answer)
