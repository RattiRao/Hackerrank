//
//  ViewController.swift
//  Practise
//
//  Created by Ratti on 16/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let X = "AGGTAB"
        let Y = "GXTXAYB"
        print(findLCS(X: X, Y: Y, m: X.count, n: Y.count))
    }
    
    func findLCS(X: String, Y: String, m: Int, n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        
        if Array(X)[m-1] == Array(Y)[n-1] {
            return 1 + findLCS(X: X, Y: Y, m: m-1, n: n-1)
        }
        else {
            return max(findLCS(X: X, Y: Y, m: m, n: n-1), findLCS(X: X, Y: Y, m: m-1, n: n))
        }
    }
    
    func printLCS(A: String, B: String) -> Int{
        let arrA = Array(A)
        let arrB = Array(B)
        var arrSubString: [[Int]] = []
        
        for i in 0 ... arrA.count {
            var arrInfo: [Int] = []
            for j in 0 ... arrB.count {
                if i == 0 || j == 0 {
                    arrInfo.append(0)
                    continue
                }
                else {
                    if arrA[i-1] == arrB[j-1] {
                        let count = 1+arrSubString[i-1][j-1]
                        arrInfo.append(count)
                    }
                    else if arrSubString[i-1][j] > arrInfo[j-1]{
                        arrInfo.append(1+arrSubString[i-1][j])
                    }
                    else {
                        arrInfo.append(1+arrInfo[j-1])
                    }
                }
            }
            arrSubString.append(arrInfo)
        }
        
        //Print LCS
        var strLCS: String = ""
        var i = arrA.count
        var j = arrB.count
        
        while i > 0 && j > 0 {
            if arrA[i-1] == arrB[j-1] {
                strLCS = String(arrA[i-1]) + strLCS
                i = i-1
                j = j-1
            }
            else if arrSubString[i-1][j] > arrSubString[i][j-1] {
                i = i-1
            }
            else {
                j = j-1
            }
        }
        print(strLCS)
        return strLCS.count
    }
}

