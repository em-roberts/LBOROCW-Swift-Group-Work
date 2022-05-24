//
//  main.swift
//  Program 4.12 (98)
//
//  Created by Jack Murdoch on 09/04/2022.
//

import Foundation

var currentElectromagneticField = Grid()

gridInit2(maxTime: 250, courantNumber: 1.0, size: 200)

ezIncInit(currentElectromagneticField)

for time in 0...maxTime {
    updateH2(currentElectromagneticField)
    updateE2(currentElectromagneticField)
    ez[0] = ezInc(time: Double(time), location: 0.0)
    print("\n", ez[50])
}



