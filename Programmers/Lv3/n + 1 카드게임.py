from collections import deque

def solution(coin, cards):
    n = len(cards)
    deck = set(cards[:(n // 3)])
    rest = deque(cards[(n // 3):])
    choice = set()
    index = (n // 3)
    answer = 1
    
    def condition(deck1, deck2):
        for card in deck1:
            targetCard = n + 1 - card
            if targetCard in deck2:
                deck1.remove(card)
                deck2.remove(targetCard)
                return True
        return False
    
    while deck:
        if rest:
            choice.add(rest.popleft())
            choice.add(rest.popleft())
        
        if condition(deck, deck):
            answer += 1
        elif coin >= 1 and condition(deck, choice):
            answer += 1
            coin -= 1
        elif coin >= 2 and condition(choice, choice):
            answer += 1
            coin -= 2
        else: break

    return answer
