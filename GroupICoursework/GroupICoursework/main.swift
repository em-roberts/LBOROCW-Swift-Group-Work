//
//  main.swift
//  GroupICoursework
//
//  Created by (s) Emily Roberts on 23/03/2022.
//

import Foundation

// new xcode project for us all to work from as to control versions and make it fully integrated with GitHub 
//MARK: CHAPTER THREE

var SIZE = 200
var electricField = [Double] (repeating: 0.0, count: SIZE)
var magneticField = [Double] (repeating: 0.0, count: SIZE - 1)
var relativePermittivity = [Double] (repeating: 0.0, count: SIZE)
let impedenceOfFreeSpace = 377.0
let maxTime = 450

for indexCount in 0 ..< SIZE {
    electricField[indexCount] = 0.0
}

for indexCount in 0 ..< SIZE - 1 {
    magneticField[indexCount] = 0.0
}

for indexCount in 0 ..< SIZE {
    if (indexCount < 100) { // free space //
        relativePermittivity[indexCount] = 1.0
    }
    else { relativePermittivity[indexCount] = 9.0
    }
}

for timeStep in 0 ..< maxTime { //time stepping
    
    magneticField[SIZE - 1] = magneticField[SIZE - 2] // simple abc
   
    for indexCount in 0 ..< SIZE - 1 { //update mag field
        magneticField[indexCount] = magneticField[indexCount] + (electricField[indexCount + 1] - electricField[indexCount]) / impedenceOfFreeSpace
    }
    
    magneticField[49] = magneticField[49] - exp(-(Double(timeStep) - 30.0) * (Double(timeStep) - 30.0) / 100.0) / impedenceOfFreeSpace // correction for mag field adjacentto TFSF boundary
    
    electricField[0] = electricField[1]
    
    for indexCount in 1 ..< SIZE { // update lec field
        electricField[indexCount] = electricField[indexCount] + (magneticField[indexCount] - magneticField[indexCount - 1]) * impedenceOfFreeSpace

    }
    
    electricField[50] = electricField[50] + exp(-(Double(timeStep) + 0.5 - (-0.5) - 30.0) * (Double(timeStep) + 0.5 - (-0.5) - 30.0) / 100.0) // correction for lec field adjacentto TFSF boundary
    
    //snapshots here delete print statement
    print (electricField[50])

}


