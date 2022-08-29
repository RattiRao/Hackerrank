//
//  ViewController.swift
//  Practise
//
//  Created by Ratti on 16/04/22.
//

import UIKit

enum DirectionLCS{
    case left, top, diagonal
}
class LCS_Item{
    var direction: DirectionLCS?
    var value: Int = 0
    var str: String?
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lookup = findLCSLookup(A: "AABCDAB", B: "BABCBA", m: 7, n: 6)
        print(printLongestRepeatedLCS(A: "ATACTCGGA", m: 8, n: 8))
    }
    
    func findLCS(A: String, B: String, m: Int, n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        let arrA = Array(A)
        let arrB = Array(B)
        if arrA[m-1] == arrB[n-1] {
            return findLCS(A: A, B: B, m: m-1, n: n-1)+1
        }
        else {
            return max(findLCS(A: A, B: B, m: m, n: n-1), findLCS(A: A, B: B, m: m-1, n: n))
        }
    }
    
    func findLCSLookup(A: String, B: String, m: Int, n: Int) -> [[Int]]{
        let arrA = Array(A)
        let arrB = Array(B)
        
        var arrInfo: [[Int]] = []
        
        for i in 0 ... arrA.count {
            var arrTemp: [Int] = []
            for j in 0 ... arrB.count {
                if i == 0 || j == 0 {
                    arrTemp.append(0)
                }
                else {
                    if arrA[i-1] == arrB[j-1] {
                        let val = arrInfo[i-1][j-1] + 1
                        arrTemp.append(val)
                    }
                    else {
                        if arrInfo[i-1][j] > arrTemp[j-1] {
                            let val = arrInfo[i-1][j]
                            arrTemp.append(val)
                        }
                        else {
                            let val = arrTemp[j-1]
                            arrTemp.append(val)
                        }
                    }
                }
            }
            arrInfo.append(arrTemp)
        }
        
        return arrInfo
    }
    
    func findLCSLookupSubstring(A: String, B: String, m: Int, n: Int) -> ([[Int]], Int, Int){
        let arrA = Array(A)
        let arrB = Array(B)
        
        var arrInfo: [[Int]] = []
        var max: Int = 0
        var iTemp: Int = 0
        var jTemp: Int = 0
        for i in 0 ... arrA.count {
            var arrTemp: [Int] = []
            for j in 0 ... arrB.count {
                if i == 0 || j == 0 {
                    arrTemp.append(0)
                }
                else {
                    if arrA[i-1] == arrB[j-1] {
                        let val = arrInfo[i-1][j-1] + 1
                        arrTemp.append(val)
                        if max < val {
                            max = val
                            iTemp = i
                            jTemp = j
                        }
                    }
                    else {
                        arrTemp.append(0)
                    }
                }
            }
            arrInfo.append(arrTemp)
        }
        print("Max is : \(max)")
        return (arrInfo, iTemp, jTemp)
    }
    
    func printLCS(A: String, B: String, m: Int, n: Int, arrInfo: [[Int]]) -> String {
        let arrA = Array(A)
        let arrB = Array(B)
        
        var m = arrA.count
        var n = arrB.count
        var strLCS: String = ""
        while m != 0 && n != 0 {
            if arrA[m-1] == arrB[n-1] {
                strLCS = String(arrA[m-1]) + strLCS
                m = m-1
                n = n-1
            }
            else {
                if arrInfo[m-1][n] > arrInfo[m][n-1] {
                    m = m-1
                }
                else {
                    n = n-1
                }
            }
        }
        return strLCS
    }
    
    func printAllLCS(A: String, B: String, m: Int, n: Int, lookup: [[Int]]) -> [String]{
        if m == 0 || n == 0 {
            return [""]
        }
        let arrA = Array(A)
        let arrB = Array(B)
        
        if arrA[m-1] == arrB[n-1] {
            var arrTemp = printAllLCS(A: A, B: B, m: m-1, n: n-1, lookup: lookup)
            for i in 0 ..< arrTemp.count {
                arrTemp[i] = arrTemp[i] + String(arrA[m-1])
            }
            return arrTemp
        }
        if lookup[m-1][n] > lookup[m][n-1] {
            return printAllLCS(A: A, B: B, m: m-1, n: n, lookup: lookup)
        }
        if lookup[m-1][n] < lookup[m][n-1]  {
            return printAllLCS(A: A, B: B, m: m, n: n-1, lookup: lookup)
        }
        var top = printAllLCS(A: A, B: B, m: m-1, n: n, lookup: lookup)
        let left = printAllLCS(A: A, B: B, m: m, n: n-1, lookup: lookup)
        top.append(contentsOf: left)
        return top
    }
    
    func longestCommonSubstring(A: String, B: String, m: Int, n: Int) -> String {
        let lookup = findLCSLookupSubstring(A: A, B: B, m: m, n: n).0
        
        let arrA = Array(A)
        let arrB = Array(B)
        var i = findLCSLookupSubstring(A: A, B: B, m: m, n: n).1
        var j = findLCSLookupSubstring(A: A, B: B, m: m, n: n).2
        
        var strLCS: String = ""
        while i != 0 && j != 0 {
            if arrA[i-1] == arrB[j-1] {
                strLCS = String(arrA[i-1]) + strLCS
                i = i-1
                j = j-1
                continue
            }
            break
        }
        return strLCS
    }
    
    func testPrintAllLCS(A: String, B:String, m: Int, n: Int) -> [String] {
        if m == 0 || n == 0 {
            return [""]
        }
        
        let lookup = findLCSLookup(A: A, B: B, m: m, n: n)
        let arrA = Array(A)
        let arrB = Array(B)
        
        if arrA[m-1] == arrB[n-1] {
            var arr = testPrintAllLCS(A: A, B: B, m: m-1, n: n-1)
            for (i,str) in arr.enumerated() {
                arr[i] = str + String(arrA[m-1])
            }
            return arr
        }
        
        if lookup[m-1][n] > lookup[m][n-1] {
            return testPrintAllLCS(A: A, B: B, m: m-1, n: n)
        }
        
        if lookup[m-1][n] < lookup[m][n-1] {
            return testPrintAllLCS(A: A, B: B, m: m, n: n-1)
        }
        
        //if lookup top and left are equal
        var arrTop = testPrintAllLCS(A: A, B: B, m: m-1, n: n)
        let arrLeft = testPrintAllLCS(A: A, B: B, m: m, n: n-1)
        
        arrTop.append(contentsOf: arrLeft)
        return arrTop
    }
    
    func longestPalindromLCS(A: String, m: Int, n: Int) -> Int {
        if m == n {
            return 1
        }
        if m > n {
            return 0
        }
        
        let arrA = Array(A)
        if arrA[m] == arrA[n] {
            return longestPalindromLCS(A: A, m: m+1, n: n-1) + 2
        }
        return max(longestPalindromLCS(A: A, m: m+1, n: n), longestPalindromLCS(A: A, m: m, n: n-1))
    }
    
    func printLongestPalindromeLCS(A: String, m: Int, n: Int) -> String {
        let lookup = findLCSLookup(A: A, B: String(A.reversed()), m: m, n: n)
        return printLCS(A: A, B: String(A.reversed()), m: m, n: n, arrInfo: lookup)
    }
    
    func longestRepeatedLCS(A: String, m: Int, n: Int) -> Int{
        if m == 0 || n == 0 {
            return 0
        }
        
        let arrA = Array(A)
        if (arrA[m-1] == arrA[n-1]) && m != n {
            return longestRepeatedLCS(A: A, m: m-1, n: n-1) + 1
        }
        return max(longestRepeatedLCS(A: A, m: m-1, n: n), longestRepeatedLCS(A: A, m: m, n: n-1))
    }
    
    func printLongestRepeatedLCS(A: String, m: Int, n: Int) -> String {
        var lookup: [[Int]] = []
        let arrA = Array(A)
        
        for i in 0 ... arrA.count {
            var arrTemp: [Int] = []
            for j in 0 ... arrA.count {
                if i == 0 || j == 0 {
                    arrTemp.append(0)
                    continue
                }
                if (arrA[i-1] == arrA[j-1]) && i != j {
                    let val = lookup[i-1][j-1] + 1
                    arrTemp.append(val)
                }
                else if lookup[i-1][j] > arrTemp[j-1] {
                    arrTemp.append(lookup[i-1][j])
                }
                else {
                    arrTemp.append(arrTemp[j-1])
                }
            }
            lookup.append(arrTemp)
        }
        
        return printRepeatedLCS(A: A, B: A, m: m, n: n, arrInfo: lookup)
    }
    
    func printRepeatedLCS(A: String, B: String, m: Int, n: Int, arrInfo: [[Int]]) -> String {
        let arrA = Array(A)
        let arrB = Array(B)
        
        var m = arrA.count
        var n = arrB.count
        var strLCS: String = ""
        while m != 0 && n != 0 {
            if (arrA[m-1] == arrB[n-1]) && m != n{
                strLCS = String(arrA[m-1]) + strLCS
                m = m-1
                n = n-1
            }
            else {
                if arrInfo[m-1][n] > arrInfo[m][n-1] {
                    m = m-1
                }
                else {
                    n = n-1
                }
            }
        }
        return strLCS
    }
}


