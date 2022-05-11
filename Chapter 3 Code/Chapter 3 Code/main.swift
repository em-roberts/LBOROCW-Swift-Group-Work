//
//  main.swift
//  Chapter 3 Code
//
//  Created by (s) Kelsey Roe on 20/03/2022.
//

import Foundation


var SIZE = 200
var LOSS = 0.02
var LOSS_LAYER = 180

var electricField = [Double] (repeating: 0.0, count: SIZE)
var magneticField = [Double] (repeating: 0.0, count: SIZE - 1)
var relativePermittivity = [Double] (repeating: 0.0, count: SIZE)
var ceze = [Double] (repeating: 0.0, count: SIZE)
var cezh = [Double] (repeating: 0.0, count: SIZE)
var chyh = [Double] (repeating: 0.0, count: SIZE - 1)
var chye = [Double] (repeating: 0.0, count: SIZE - 1)

let impedenceOfFreeSpace = 377.0
let maxTime = 250

for indexCount in 0 ..< SIZE {
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

for indexCount in 0 ..< SIZE - 1 {
    if (indexCount < LOSS_LAYER) {
        chyh[indexCount] = 1.0
        chye[indexCount] = 1.0 / impedenceOfFreeSpace
    }
    else {
        chyh[indexCount] = (1.0 - LOSS) / (1.0 + LOSS)
        chye[indexCount] = 1.0 / impedenceOfFreeSpace / (1.0 + LOSS)
    }
}

for timeStep in 0 ..< maxTime {
   
    for indexCount in 0 ..< SIZE - 1 {
        magneticField[indexCount] = chyh[indexCount] * magneticField[indexCount] + chye[indexCount] * (electricField[indexCount + 1] - electricField[indexCount])
    }
    
    magneticField[49] = magneticField[49] - exp(-(Double(timeStep) - 30.0) * (Double(timeStep) - 30.0) / 100.0) / impedenceOfFreeSpace
    
    electricField[0] = electricField[1]
    
    for indexCount in 1 ..< SIZE - 1 {
        electricField[indexCount] = ceze[indexCount] * electricField[indexCount] + cezh[indexCount] * (magneticField[indexCount] - magneticField[indexCount - 1])
    }
    
    electricField[50] = electricField[50] + exp(-(Double(timeStep) + 0.5 - (-0.5) - 30.0) * (Double(timeStep) + 0.5 - (-0.5) - 30.0) / 100.0)
    
    print (electricField[50])
    
}

// need Gnuplot to work out how to get snapshots


