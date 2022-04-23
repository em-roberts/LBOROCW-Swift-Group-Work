//
//  chapter4extras.swift
//  chap4
//
//  Created by (s) Emily Roberts on 30/03/2022.
//

import Foundation

func AllocationIn1D(maxTime: Int, courantNumber: Double, time: Int) {
    currentElectromagneticField.electricField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    
    currentElectromagneticField.magneticField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    
    currentElectromagneticField.time = time
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
}

var amp = 0.0
var phase = 0.0

func harmonicInit2() { 
    print("Enter the Amplitude")
    amp = Double(readLine() ?? "0") ?? 0
    print("Enter the phase in degrees: ")
    phase = Double(readLine() ?? "0") ?? 0
    phase *= Double.pi / 180 
}

func harmonic2(x: Double) -> Double {
    return amp * cos(x + phase)
}