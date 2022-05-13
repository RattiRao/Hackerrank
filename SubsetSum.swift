//
//  SubsetSum.swift
//  Practise
//
//  Created by Ratti on 16/04/22.
//

import UIKit

class SubsetSum: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let arr = [7,3,2,5,8]
        print(isSubsetSum(A: arr, n: arr.count-1, k: 14))
    }
    
    func isSubsetSum(A: [Int], n: Int, k: Int) -> Bool {
        if k == 0 { return true }
        if k < 0 || n < 0 { return false }
        
        let inclusive: Bool = isSubsetSum(A: A, n: n-1, k: k - A[n])
        let exclusive: Bool = isSubsetSum(A: A, n: n-1, k: k)
        
        return inclusive || exclusive
    }
    
}

