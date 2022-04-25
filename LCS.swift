//
//  ViewController.swift
//  Practise
//
//  Created by Ratti on 16/04/22.
//

import UIKit

struct Pair{
    var value: Int
    var diff: Int
}

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
}

