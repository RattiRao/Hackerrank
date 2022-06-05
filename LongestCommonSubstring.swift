//
//  LongestCommonSubstring.swift
//  Practise
//
//  Created by Ratti on 05/06/22.
//

import Foundation
func findLongestCommonSubstringLength(A: String, B: String) -> Int{
    let arrA = Array(A)
    let arrB = Array(B)
    var maxCount = 0
    var arrSubString: [[Int]] = []
    
    for i in 0 ... arrA.count {
        var arrInfo: [Int] = []
        for j in 0 ... arrB.count {
            if i == 0 {
                arrInfo.append(0)
                continue
            }
            else if j == 0 {
                arrInfo.append(0)
                continue
            }
            else {
                if arrA[i-1] == arrB[j-1] {
                    let count = 1+arrSubString[i-1][j-1]
                    arrInfo.append((count))
                    if count > maxCount {
                        print(arrA[i-1])
                        maxCount = count
                    }
                }
                else {
                    arrInfo.append(0)
                }
            }
        }
        arrSubString.append(arrInfo)
    }
    return maxCount
}
