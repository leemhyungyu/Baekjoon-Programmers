# 프로그래머스: 문자열 압축 (구현)
def solution(s):
  
  answer = len(s)

  # 압축은 1부터 문자열의 길이 / 2까지 가능
  for step in range(1, len(s) // 2 + 1):
    # 압축된 문자열을 저장할 변수
    compressed = ""
    # 문자열을 압축하는 기준이 되는 문자열
    prev = s[0:step]
    
    cnt = 1
    # 압축할 문자열의 길이를 step만큼 증가시키며 이전 문자열과 비교
    for j in range(step, len(s), step):
      # 만약 이전 문자열과 문자열이 같으면 cnt + 1 해줌
      if prev == s[j:j+step]:
        cnt += 1
      # 그렇지 않으면 (압축이 안되는 상황)
      else: 
        # 만약 cnt가 2보다 크면(그전에 압축이 되었더라면) 압축된 횟수 + 압축한 문자열을 더해줌, 그렇지 않으면 문자열만 더해줌        
        compressed += str(cnt) + prev if cnt >= 2 else prev
        # 압축하는 기준이 되는 문자열을 현재 위치에 step만큼 증가시켜 저장
        prev = s[j:j+step]
        cnt = 1

    # 마지막에 비교할 문자열을 저장    
    compressed += str(cnt) + prev if cnt >= 2 else prev
    answer = min(answer, len(compressed))
    print(compressed)
    
  return answer
