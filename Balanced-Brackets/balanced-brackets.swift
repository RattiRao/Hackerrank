//
//  File.swift
//  DemoTest
//
//  Created by Ratti on 17/05/21.
//

import Foundation

func checkCloseBracket(bracket1: String, bracket2: String) -> Bool{
    if bracket1 == "{" && bracket2 == "}"{
        return true
    }
    else if bracket1 == "(" && bracket2 == ")"{
        return true
    }
    else if bracket1 == "[" && bracket2 == "]"{
        return true
    }
    return false
}

func isBalanced(s: String) -> String {
    // Write your code here
    var arrStrings: Array<String> = []
    
    for char in s {
        let str = String.init(char)
        arrStrings.append(str)
        if arrStrings.count >= 2{
            if checkCloseBracket(bracket1: arrStrings[arrStrings.count - 2], bracket2: arrStrings.last!){
                arrStrings.removeLast()
                arrStrings.removeLast()
            }
        }
    }
    return arrStrings.isEmpty ? "YES" : "NO"
}
