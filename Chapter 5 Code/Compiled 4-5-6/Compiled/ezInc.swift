//
//  ezInc.swift
//  Compiled
//
//  Created by (s) Damien Sorrell on 17/05/2022.
//

import Foundation

private var ppw = 0.0
var cdtds = courantNumber
public func ezIncInit(_ g: Grid) -> Void {
     print("Enter points per wavelength:")
     ppw = Double(readLine() ?? "0") ?? 0
    return

 }
public func ezInc(_ time: Double, location: Double) -> Double {
    if ppw <= 0.0 {
         print(
               "ezInc: must call ezIncInit before ezInc.\n",
                 "       Point per wavelength must be positive. \n")
        exit(-1)
     }
    return sin(2.0 * Double.pi / ppw * (cdtds * time - location))
 }


