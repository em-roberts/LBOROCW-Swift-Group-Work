//
//  gridInit2.swift
//  Program 4.12 - fdtd2.h
//
//  Created by Jack Murdoch on 09/04/2022.
//

import Foundation

public func gridInit2 (maxTime: Int, courantNumber: Double, size: Int) -> Void {
    currentElectromagneticField.size = size
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
    currentElectromagneticField.electricField = [Double](repeating: 0.0, count: size)
    currentElectromagneticField.magneticField = [Double](repeating: 0.0, count: size)
}
