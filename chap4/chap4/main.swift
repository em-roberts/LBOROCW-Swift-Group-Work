//
//  main.swift
//  chap4
//
//  Created by (s) Emily Roberts on 30/03/2022.
//
// mm is indexCount
import Foundation

public struct Grid {
    var electricField: [Double] = []
    var magneticField: [Double] = []
    var size = 0
    var time = 0
    var maxTime = 0
    var courantNumber = 0.0
    
}

var LOSS = 0.0
var LOSS_LAYER = 0
var amplitude: Double = 0.0
var phase: Double = 0.0
var x_1: Double

let impedenceOfFreeSpace = 377.0
let timeLimit = 250
let num_points = 100

public var currentElectromagneticField = Grid()

print("Enter the size of the array")
currentElectromagneticField.size = Int(readLine() ?? "0") ?? 0
// look at if put 0, double, letter (error handling)
AllocationIn1D(maxTime: 50, courantNumber: 1.0, time: 5)

print("Enter the amplitude: ")
amplitude = Double(readLine() ?? "0") ?? 0

print("Enter the phase [in degrees]: ")
phase = Double(readLine() ?? "0") ?? 0
phase = phase * (Double.pi) / 180.0

var electricField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var magneticField = [Double] (repeating: 0.0, count: currentElectromagneticField.size - 1)
var relativePermittivity = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var ceze = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var cezh = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
var chyh = [Double] (repeating: 0.0, count: currentElectromagneticField.size - 1)
var chye = [Double] (repeating: 0.0, count: currentElectromagneticField.size - 1)


harmonicInit1(the_amp: amplitude, the_phase: phase)


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
        
        for timeStep in 0 ..< timeLimit {
            for indexCount in 0 ..< currentElectromagneticField.size - 1 {
                magneticField[indexCount] = chyh[indexCount] * magneticField[indexCount] + chye[indexCount] * (electricField[indexCount + 1] - electricField[indexCount])
            }
    
            magneticField[49] = magneticField[49] - exp(-(Double(timeStep) - 30.0) * (Double(timeStep) - 30.0) / 100.0) / impedenceOfFreeSpace
    
            electricField[0] = electricField[1]
    
            for indexCount in 1 ..< currentElectromagneticField.size - 1 {
                electricField[indexCount] = ceze[indexCount] * electricField[indexCount] + cezh[indexCount] * (magneticField[indexCount] - magneticField[indexCount - 1])
            }
    
            electricField[50] = electricField[50] + exp(-(Double(timeStep) + 0.5 - (-0.5) - 30.0) * (Double(timeStep) + 0.5 - (-0.5) - 30.0) / 100.0)
            
            for indexCount in 0 ..< num_points {
                x_1 = 2.0 * (Double.pi) * Double(indexCount) / Double(num_points - 1)
                print(harmonic1(x: x_1))
            }
    
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

//Chapter 4 begins
// Learning how to do inputs
/*
var ez = [Double] (repeating: 0.0, count: SIZE)
print("Enter the size of the array")
var numberOfElementsInArray = Int(readLine() ?? "12") ?? 12
ez = [Double] (repeating: 0.0, count: (numberOfElementsInArray + 1))
for indexCount in 0 ..< numberOfElementsInArray + 1 {
    ez[indexCount] = 3.0 * Double(indexCount)
    
    print(ez[indexCount])
}
*/
 
// Fragment 4.2 not necessary
// Pointers break the code, avoid
//macros

