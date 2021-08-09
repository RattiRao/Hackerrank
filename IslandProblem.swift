//
//  IslandProblem.swift
//  Demo
//

import UIKit

class IslandProblem {
    var arr = [
        [1,1,1,1,0,0],
        [1,1,0,1,0,1],
        [0,0,0,0,1,0],
        [0,0,1,0,0,0]
    ]
    
    func islandFormationCount() -> Int {
        var result: Int = 0
        for row in 0 ..< arr.count{
            for column in 0 ..< arr[row].count{
                if arr[row][column] == 1{
                    result += 1
                }
                findIslandGroup(row: row, column: column)
            }
        }
        return result
    }
    
    func findIslandGroup(row: Int, column: Int){
        if arr[row][column] == 0 || arr[row][column] == 2{
            return
        }
        if arr[row][column] == 1{
            arr[row][column] = 2
        }
        //left
        if column != 0{
            print("left\n")
            findIslandGroup(row: row, column: column-1)
        }
        //right
        if column != (arr[row].count - 1){
            print("right\n")
            findIslandGroup(row: row, column: column+1)
        }
        //top
        if row != 0{
            print("top\n")
            findIslandGroup(row: row-1, column: column)
        }
        //bottom
        if row != arr.count - 1{
            print("bottom\n")
            findIslandGroup(row: row+1, column: column)
        }
    }
}

