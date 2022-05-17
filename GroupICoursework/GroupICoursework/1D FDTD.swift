//
//  1D FDTD.swift
//  GroupICoursework
//
//  Created by (s) Kelsey Roe on 17/05/2022.
//

import Foundation

public func AllocationIn1D(maxTime: Int, courantNumber: Double, time: Int) {
    currentElectromagneticField.electricField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    
    currentElectromagneticField.magneticField = [Double] (repeating: 0.0, count: currentElectromagneticField.size)
    
    currentElectromagneticField.time = time
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
}

public struct Grid {
    var electricField: [Double] = []
    var magneticField: [Double] = []
    var time = 0
    var maxTime = 0
    var courantNumber = 0.0
    var size = 0
    
}

