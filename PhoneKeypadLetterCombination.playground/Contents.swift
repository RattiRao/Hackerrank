//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    var arrKeypads: Array<Array<String>> = [
        [],["a", "b", "c"], ["d", "e", "f"],
        ["g", "h", "i"],["j", "k", "l"], ["m", "n", "o"]
    ]
    
    override func loadView() {
        findLetterCombinations(digits: "23")
    }
    
    func findLetterCombinations(digits: String) {
        let arr = Array(digits)
        let arrIndex: Array<Int> = arr.map{Int(String($0)) ?? 0}
        var arrCombination: [[String]] = []
        
        for index in arrIndex{
            arrCombination.append(arrKeypads[index - 1])
        }
        
        for value in arrCombination.first!{
            analysePattern(arrInfo: arrCombination, combination: value, index: 0)
        }
    }
    
    func analysePattern(arrInfo: [[String]], combination: String, index: Int) {
        if index == arrInfo.count - 1{
            let arr = arrInfo.last!
            for value in arr{
                print(combination + value)
                print("\n")
            }
            return
        }
        
        if (index+1) != arrInfo.count - 1{
            let arr = arrInfo[index+1]
            for value in arr{
                var comb = combination
                comb = comb + value
                analysePattern(arrInfo: arrInfo, combination: comb, index: index+1)
            }
        }
        else{
            analysePattern(arrInfo: arrInfo, combination: combination, index: index+1)
        }
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
