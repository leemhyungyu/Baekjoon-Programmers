# www.acmicpc.net/problem/1991
# 백준 1991번: 트리 순회


n = int(input())
tree = {}

for _ in range(n):
  x, y, z = input().split()
  
  tree[x] = [y, z]


# 전위 순회
def preorder(x):

  if x != '.':
    print(x, end = "")
    preorder(tree[x][0])
    preorder(tree[x][1])

# 중위 순회
def inorder(x):

  if x != '.':
    inorder(tree[x][0])
    print(x, end = "")
    inorder(tree[x][1])
    
# 후위 순회 
def postorder(x):

  if x != '.':
    postorder(tree[x][0])
    postorder(tree[x][1])
    print(x, end = "")
  

preorder("A")
print()
inorder("A")
print()
postorder("A")
  
