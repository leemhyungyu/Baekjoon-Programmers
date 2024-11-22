def solution(sequence):
    oddSequence = []
    evenSequence = []
    
    for i in range(len(sequence)):
        if i % 2 == 0:
            evenSequence.append(sequence[i] * -1)
            oddSequence.append(sequence[i])
        else:
            evenSequence.append(sequence[i])
            oddSequence.append(sequence[i] * -1)
    
    for i in range(1, len(sequence)):
        oddSequence[i] = max(oddSequence[i], oddSequence[i - 1] + oddSequence[i])
        evenSequence[i] = max(evenSequence[i], evenSequence[i - 1] + evenSequence[i])
        
    return max([max(evenSequence), max(oddSequence)])

