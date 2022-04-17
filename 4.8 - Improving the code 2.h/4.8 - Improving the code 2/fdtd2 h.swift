//
//  Macro for Variable Definitions.swift
//  Program 4.12 - fdtd2.h
//
//  Created by Jack Murdoch on 9/04/2022.
//

import Foundation

public struct Grid {
    var electricField: [Double] = []
    var magneticField: [Double] = []
    var size = 0
    var time = 0
    var courantNumber = 0.0
    var maxTime = 0
}

public var ez = currentElectromagneticField.electricField
public var hz = currentElectromagneticField.magneticField
public var size = currentElectromagneticField.size
public var time = currentElectromagneticField.time
public var courantNumber = currentElectromagneticField.courantNumber
public var maxTime = currentElectromagneticField.maxTime
