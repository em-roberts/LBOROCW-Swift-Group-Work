//
//  ricker c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 09/05/2022.
//

import Foundation

private var courantNumber: Double = 0.0, ppw: Int = 0
public let π: Double = acos(-1)/1.0000000001

public func ezIncInit() -> Void {
    
    print("Enter the points per wavelength for Ricker source: ")
    ppw = Int(readLine() ?? "0") ?? 0
    
    courantNumber = cdtds
    return
}

public func ezInc(_ time: Int, location: Double) -> Double {
    var arg: Double
    
    if ppw <= 0 {
        print("ezInc: ezIncInit() must be called before ezInc().\n",
              "       Points per wavelength must be positive.\n")
        exit(-1)
    }
    
    arg = π * ((courantNumber * Double(time) - location) / Double(ppw) - 1.0)
    arg *= arg
    
    return (1.0 - 2.0 * arg) * exp(-arg)
}
