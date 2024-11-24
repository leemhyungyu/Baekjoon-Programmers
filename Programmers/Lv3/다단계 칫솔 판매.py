import math

def solution(enroll, referral, seller, amount):
    graph = {}
    benefit = {}

    for i in range(len(referral)):
        graph[enroll[i]] = referral[i]
        benefit[enroll[i]] = 0
    
    for i in range(len(seller)):
        nowSeller, nowAmount = seller[i], amount[i] * 100
        
        while graph.get(nowSeller):
            if nowAmount * 0.1 >= 1:
                benefit[nowSeller] += math.ceil(nowAmount * 0.9)
                nowSeller = graph[nowSeller]
                nowAmount = math.floor(nowAmount * 0.1)
            else:
                benefit[nowSeller] += math.floor(nowAmount)
                break
            
    answer = []
    
    for i in enroll:
        answer.append(benefit[i])
        
    return answer
