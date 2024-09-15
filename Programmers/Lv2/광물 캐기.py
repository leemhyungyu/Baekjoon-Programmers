def solution(picks, minerals):
    if picks[0] * 5 >= len(minerals): return len(minerals)
    answer = []
    
    def backtraking(score, index):
        if index >= len(minerals) or picks == [0, 0, 0]:
            answer.append(score)
            return 
        
        for i in range(0, 3):
            if picks[i] < 1: continue
            picks[i] -= 1
            newScore = score + calculate(i, minerals, index)
            backtraking(newScore, index + 5)
            picks[i] += 1
            
    backtraking(0, 0)
    
    return min(answer)

def calculate(pick, minerals, index):
    score = 0
    for mineral in minerals[index:index + 5]:
        score += breakMineral(pick, mineral)
        
    return score
        
        
def breakMineral(pick, mineral): 
    if pick == 0: return 1
    
    if pick == 1:
        if mineral == "diamond": return 5
        else: return 1
    
    if pick == 2:
        if mineral == "diamond": return 25
        elif mineral == "iron": return 5
        else: return 1
    
