//
//  main.swift
//  GroupICoursework
//
//  Created by (s) Emily Roberts on 23/03/2022.
//

import Foundation

// new xcode project for us all to work from as to control versions and make it fully integrated with GitHub 
//MARK: CHAPTER THREE

public struct Grid {
    var electricField: [Double] = []
    var magneticField: [Double] = []
    var size = 0
    var time = 0
    var maxTime = 0
    var courantNumber = 0.0
    
}

func AllocationIn1D(maxTime: Int, courantNumber: Double, time: Int) {
    currentElectromagneticField.electricField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    
    currentElectromagneticField.magneticField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    
    currentElectromagneticField.time = time
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
}

var LOSS = 0.0
var LOSS_LAYER = 0

let impedenceOfFreeSpace = 377.0
let maxTime = 250

public var currentElectromagneticField = Grid()

print("Enter the size of the array")
currentElectromagneticField.size = Int(readLine() ?? "0") ?? 0
// look at if put 0, double, letter (error handling)

AllocationIn1D(maxTime: 50, courantNumber: 1.0, time: 5)

var electricField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var magneticField = [Double] (repeating: 0.0, count: currentElectromagneticField.size - 1)
var relativePermittivity = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var ceze = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var cezh = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var chyh = [Double] (repeating: 0.0, count: currentElectromagneticField.size - 1)
var chye = [Double] (repeating: 0.0, count: currentElectromagneticField.size - 1)


for indexCount in 0 ..< currentElectromagneticField.size {
    if (indexCount < 100) { // free space //
        ceze[indexCount] = 1.0
        cezh[indexCount] = impedenceOfFreeSpace
    }
    else if (indexCount < LOSS_LAYER) {
        ceze[indexCount] = 1.0
        cezh[indexCount] = impedenceOfFreeSpace / 9.0
    }
    else { // lossy dielectric //
        ceze[indexCount] = (1.0 - LOSS) / (1.0 + LOSS)
        cezh[indexCount] = impedenceOfFreeSpace / 9.0 / (1.0 + LOSS)
    }
}

for indexCount in 0 ..< currentElectromagneticField.size - 1 {
    if (indexCount < LOSS_LAYER) {
        chyh[indexCount] = 1.0
        chye[indexCount] = 1.0 / impedenceOfFreeSpace
    }
    else {
        chyh[indexCount] = (1.0 - LOSS) / (1.0 + LOSS)
        chye[indexCount] = 1.0 / impedenceOfFreeSpace / (1.0 + LOSS)
    }
}

let date = Date() // to ID run by execution time and avoid overwriting previous files
let pathToFile = "/Users/phecr/OneDrive - Loughborough University/computational_data/"
//let writeFilename = pathToFile + "test_" + date.description + ".dat"
let writeFilename = pathToFile + "test_"  + ".dat"

let fileHasBeenWritten = FileManager.default.createFile(atPath: writeFilename, contents: nil, attributes: nil)

if fileHasBeenWritten {
    // Do not worry about do, try and catch now - we will cover this later (it is about dealing with runtime errors).
    do {
        
        var outputText = String()
        
        for timeStep in 0 ..< maxTime {
            for indexCount in 0 ..< currentElectromagneticField.size - 1 {
                magneticField[indexCount] = chyh[indexCount] * magneticField[indexCount] + chye[indexCount] * (electricField[indexCount + 1] - electricField[indexCount])
            }
    
            magneticField[49] = magneticField[49] - exp(-(Double(timeStep) - 30.0) * (Double(timeStep) - 30.0) / 100.0) / impedenceOfFreeSpace
    
            electricField[0] = electricField[1]
    
            for indexCount in 1 ..< currentElectromagneticField.size - 1 {
                electricField[indexCount] = ceze[indexCount] * electricField[indexCount] + cezh[indexCount] * (magneticField[indexCount] - magneticField[indexCount - 1])
            }
    
            electricField[50] = electricField[50] + exp(-(Double(timeStep) + 0.5 - (-0.5) - 30.0) * (Double(timeStep) + 0.5 - (-0.5) - 30.0) / 100.0)
    
            for i in 0 ..< electricField.count {
                outputText.append(timeStep.description)
                outputText.append("\t")
                outputText.append(i.description)
                outputText.append("\t")
                outputText.append(electricField[i].description)
                outputText.append("\n")
            }
            outputText.append("\n")
            print(electricField[50])
        }
        try outputText.write(toFile: writeFilename, atomically: false, encoding: .utf8)
    } catch {
        // code for error handling here - which we have not studied yet
    }
    
}
