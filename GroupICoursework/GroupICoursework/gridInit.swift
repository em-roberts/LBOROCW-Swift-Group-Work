//
//  gridInit.swift
//  GroupICoursework
//
//  Created by (s) Kelsey Roe on 19/05/2022.
//

import Foundation

public func gridInit (maxTime: Int, courantNumber: Double, size: Int) -> Void {
    currentElectromagneticField.size = size
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
    currentElectromagneticField.electricField = [Double](repeating: 0.0, count: size)
    currentElectromagneticField.magneticField = [Double](repeating: 0.0, count: size)
}
