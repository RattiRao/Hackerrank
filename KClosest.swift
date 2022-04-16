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
        //Find k closest elements to a given value
        let result = findClosest(k: 4, x: 35, arr: [12, 16, 22, 30, 35, 39, 42,45, 48, 50, 53, 55, 56])
        print(result)
    }
    
    func findClosest(k: Int, x: Int, arr: [Int]) -> [Pair] {
        var arrMaxHeap: [Pair] = []
        
        for i in 0 ..< arr.count{
            if arrMaxHeap.count < k{
                arrMaxHeap.append(Pair.init(value: arr[i], diff: Int(abs(arr[i] - x))))
            }
            else{
                let maxPair = arrMaxHeap.max { p1, p2 in
                    p2.diff > p1.diff
                }
                if Int(abs(arr[i] - x)) < maxPair!.diff
                    || (Int(abs(arr[i] - x)) == maxPair!.diff && arr[i] < maxPair!.value)
                {
                    arrMaxHeap.remove(at: (arrMaxHeap.firstIndex{$0.value == maxPair?.value})!)
                    arrMaxHeap.append(Pair(value: arr[i], diff: Int(abs(arr[i] - x))))
                }
            }
        }
        return arrMaxHeap
    }
}

