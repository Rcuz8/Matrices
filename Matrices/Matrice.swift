//
//  Matrice.swift
//  Matrices
//
//  Created by Ryan Cocuzzo on 6/21/17.
//  Copyright © 2017 rcocuzzo8. All rights reserved.
//

import Foundation


import CoreData
import UIKit
class Matrice: NSObject {
    
    var augmentedMatrix = [[Int]]()
    
    init(augmented: [[Int]]) {
        augmentedMatrix = augmented
    }
    
    func rowOperation(changing: [Int], other: [Int], at: Int) -> [Int] {
        var pos = 0
        var changed = changing
        while pos < changing.count {
            let otherOp = (other[pos] * changing[at] * -1)
            changed[pos] = changing[pos] + otherOp
            
            pos+=1
        }
        return changed
    }
    
    func simplifyExpression(row: [Int], positionThatWillBeDivisor: Int) -> [Int] {
        var newRow = row
        //     print(row)
        var pos = 0
        let div = newRow[positionThatWillBeDivisor]
        while pos < newRow.count {
            
            newRow[pos] = newRow[pos]/div
            pos+=1
        }
        
        return newRow
    }
    
    func solve2X2Gaussian() -> [String: Int] {
        
        print("Begin Solving\n\n")
        
        var firstRow = augmentedMatrix[0]
        var secondRow = augmentedMatrix[1]
        
        func swapRows() {
            let tempFirst = firstRow
            firstRow = secondRow
            secondRow = tempFirst
        }
        
        func printRows() {
            print("Rows Currently:\n")
            print(firstRow)
            print(secondRow)
            print()
            print()
        }
        
        // Step 1 --> Make first variable One
        var pos = 0
        firstRow = simplifyExpression(row: firstRow, positionThatWillBeDivisor: 0)
        printRows()
        
        // Step 2 --> Multply R-1 by Neg. R-2's x value, add it to each R-2 val
        
        secondRow = rowOperation(changing: secondRow, other: firstRow, at: 0)
        printRows()
        
        pos = 0
        
        
        // Step 3 --> Simplify
        
        secondRow = simplifyExpression(row: secondRow, positionThatWillBeDivisor: 1)
        
        
        //  Step 4
        
        swapRows()
        
        printRows()
        
        //Step 5
        
        secondRow = rowOperation(changing: secondRow, other: firstRow, at: 1)
        
        
        
        //    printRows()
        
        // Step 6
        
        swapRows()
        
        var xAnswer = firstRow[2]
        var yAnswer = secondRow[2]
        
        let answers = [
            "x" : xAnswer,
            "y" : yAnswer
        ]
        
        return answers
    }
    
    
    
    
    
    var matrixDescription: String
        {
        
        set{
            // Cannot Be Set
        }
        
        get {
            var retString = ""
            var i = augmentedMatrix.count
            var n = augmentedMatrix[0].count
            print("Vertical Columns: \(i)")
            print("Horizontal Rows: \(n)")
            var hCounter = 0
            var vCounter = 0
            while vCounter < i {
                if retString.characters.count == 0 {
                    retString.append("Matrix:\n\n[ ")
                } else {
                    retString.append("[ ")
                }
                while hCounter < n {
                    let slotNumber: Int = augmentedMatrix[vCounter][hCounter]
                    if let slotString = String(slotNumber) as? String {
                        //     print(slotString)
                        //  print(slotString)
                        retString.append(slotString)
                        retString.append(" ")
                        hCounter+=1
                    }
                    
                }
                retString.append(" ]\n")
                hCounter=0
                vCounter+=1
            }
            return retString
        }
    }
    
    
    
}






































