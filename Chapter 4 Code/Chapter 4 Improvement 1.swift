//
//  Chapter 4 Improvement 1.swift
//  Chapter 4
//
//  Created by (s) Kelsey Roe on 27/03/2022.
//

import Foundation

public func AllocationIn1D (maxTime: Int, courantNumber: Double, time: Int) {
    currentElectromagneticField.electricField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    currentElectromagneticField.magneticField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    currentElectromagneticField.time = time
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
}
