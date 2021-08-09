//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    var arrGraph: [[Int]] = [
        [0,1],[1,2], [2,0]
    ]
    var graph: Dictionary<Int,[Int]> = Dictionary()
    override func loadView() {
        self.graph = getDetectGraphCycle()
        self.detectGraphCycle(node: 0)
    }
    
    func getDetectGraphCycle() -> Dictionary<Int,[Int]> {
        //Create hashmap for graph
        var node: Dictionary<Int,[Int]> = Dictionary()
        for nodes in arrGraph{
            if var arrChild = node[nodes[1]]{
                arrChild.append(nodes.last!)
                node[nodes.first!] = arrChild
            }
            else{
                node[nodes.first!] = [nodes.last!]
            }
        }
        return node
    }
    
    func detectGraphCycle(node: Int){
        guard let arr = graph[node] else {
            return
            
        }
        
        if arr.isEmpty{
            return
        }
        
        for (i,nodeInfo) in arr.enumerated(){
            if nodeInfo == -1{
                print("Cycle Detected")
                return
            }
            graph[node]![i] = -1
            detectGraphCycle(node: nodeInfo)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
