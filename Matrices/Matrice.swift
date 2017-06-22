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
        
        var xRowOne = firstRow[0]
        var pos = 0
        for number in  firstRow {
            firstRow[pos] = number/xRowOne
            pos+=1
        }
        
        pos = 0
        
        printRows()
        
        // Step 2 --> Multply R-1 by Neg. R-2's x value, add it to each R-2 val
        
        let xRowTwo = secondRow[0]
        
        while pos < firstRow.count {
            var tempFirstRowVar = firstRow[pos]
            tempFirstRowVar = tempFirstRowVar * xRowTwo * -1
            secondRow[pos] = secondRow[pos]+tempFirstRowVar
            pos+=1
        }
        
        pos = 0
        
        printRows()
        
        // Step 3 --> Simplify
        
        let step3divisor = secondRow[1]
        
        while pos < secondRow.count {
            secondRow[pos] = secondRow[pos]/step3divisor
            pos+=1
        }
        
        pos = 0
        
        printRows()
        
        //  Step 4
        
        swapRows()
        
        print("Before step 5")
        printRows()
        
        //Step 5
        
        
        let yRowTwo = secondRow[1]
        
        while pos < firstRow.count {
            var tempFirstRowVar = firstRow[pos]
            secondRow[pos] = secondRow[pos]+firstRow[pos]*yRowTwo * -1
            pos+=1
        }
        
        
        printRows()
        
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




















