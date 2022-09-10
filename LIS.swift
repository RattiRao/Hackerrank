//
//  LIS.swift
//  Practise
//
//  Created by Ratti on 10/09/22.
//

import Foundation

func printSequence() {
    longestDecreasingSubsequence(arrValue: [0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15])
}

func longestIncreasingSubsequence(arrValue: [Int]) {
    var LIS: [[Int]] = Array(repeating: [], count: arrValue.count)
    LIS[0] = [arrValue.first!]
    
    for i in 1 ..< arrValue.count {
        for j in 0 ..< i {
            if (arrValue[j] < arrValue[i]) && LIS[i].count < LIS[j].count {
                LIS[i] = LIS[j]
            }
        }
        LIS[i].append(arrValue[i])
        print(LIS)
        print("\n")
    }
}

func longestDecreasingSubsequence(arrValue: [Int]) {
    var LIS: [[Int]] = Array(repeating: [], count: arrValue.count)
    
    LIS[0] = [arrValue.first!]
    
    for i in 1 ..< arrValue.count {
        for j in 0 ..< i {
            if arrValue[j] > arrValue[i] && LIS[i].count < LIS[j].count {
                LIS[i] = LIS[j]
            }
        }
        LIS[i].append(arrValue[i])
        print(LIS)
        print("\n")
    }
}

