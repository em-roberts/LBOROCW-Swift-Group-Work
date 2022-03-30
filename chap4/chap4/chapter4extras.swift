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

func harmonicInit1(the_amp: Double, the_phase: Double) -> Void{
    amplitude = the_amp
    phase = the_phase
}

func harmonic1(x: Double) -> Double {
    return amplitude * cos(x + phase)
}
