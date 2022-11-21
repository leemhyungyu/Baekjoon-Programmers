//
//  Baekjoon10825.swift
//  
//
//  Created by 임현규 on 2022/09/29.
//

import Foundation

let n = Int(readLine()!)!

var array = [(String, Int, Int, Int)]() // 이름, 국어, 영어, 수학

for _ in 0...(n - 1) {
  let inputText = readLine()!.split(separator: " ")

  array.append((String(inputText[0]), Int(inputText[1])!, Int(inputText[2])!, Int(inputText[3])!))
}

/*
  1. 국어 점수 감소하는 순서로
  2. 국어 점수가 같으면 영어 점수가 증가하는 순서로
  3. 국어 점수와 영어 점수가 같으면 수학 점수가 감소하는 순서로
  4. 모든 점수가 같으면 이름이 사전 순으로 증가하는 순서로

  1. 국어가 점수가 같지 않으면 -> 국어 점수 감소하는 순서로
  2. 국어 점수 같고, 영어 점수 같으면 -> 수학 점수 감소하는 순서로
  3. 국어 점수 같고, 영어 점수 다르면 -> 영어 점수 증가하는 순서로
  4. 국어 점수 같고, 영어 점수 같고, 수학 점수 같으면 -> 이름이 사전 순으로 증가하는 순서로
  5. 국어 점수 같고, 영어 점수 같고, 수학 점수 다르면 -> 수학 점수가 감소하는 순서로
*/

// 이름 $0.0
// 국어 점수 $0.1
// 영어 점수 $0.2
// 수학 점수 $0.3

let sortedArray = array.sorted(by: { $0.1 == $1.1 ? $0.2 == $1.2 ? $0.3 == $1.3 ? $0.0 < $1.0 : $0.3 > $1.3 : $0.2 < $1.2 : $0.1 > $1.1})

for i in sortedArray {
  print(i.0)
}
