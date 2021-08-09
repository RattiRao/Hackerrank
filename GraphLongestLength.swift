//
//  GraphLongestLength.swift
//  Demo
//
//

import UIKit

class GraphLongestLength: UIViewController {
    
    var dicGraph: Dictionary<Int, Array<Array<Int>>> = Dictionary()
    var arrPaths: Array<Array<Int>> = [
        [1,2,3],
        [2,3,4],
        [2,6,2],
        [6,4,6],
        [6,5,5]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.findLongestPath()
    }
    
    func findLongestPath(){
        //Create graph
        for arr in arrPaths{
            let key = arr[0]
            let nodeInfo = [arr[1],arr[2]]
            if dicGraph[key] == nil{
                dicGraph[key] = [nodeInfo] // [node,length]
            }
            else{
                var nodes = dicGraph[key] ?? []
                nodes.append(nodeInfo)
                dicGraph[key] = nodes
            }
        }
        print(dicGraph)
        
        //Traverse Path
        for node in dicGraph[1]!{
            traverseGraphLength(node: node, key: node.first!, updatedLength: 0)
        }
    }
    
    func traverseGraphLength(node: [Int], key: Int, updatedLength: Int){
        let lengthCalculated = updatedLength + node[1]
        if (dicGraph[key] ?? []).isEmpty{
            print("Length found: \(lengthCalculated)")
            return
        }
        
        for node in dicGraph[key]!{
            traverseGraphLength(node: node, key: node[0], updatedLength: lengthCalculated)
        }
    }
}

