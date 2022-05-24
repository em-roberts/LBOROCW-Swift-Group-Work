//
//  tfsf.swift
//  Compiled
//
//  Created by (s) Damien Sorrell on 17/05/2022.
//

import Foundation

private var tfsfBoundary: Int = 0

public func tfsfInit(_ g: Grid) -> Void {
    
    print ("Enter the location of the TFSF boundary:")
    tfsfBoundary = Int(readLine() ?? "0") ?? 0
    
    ezIncInit(currentElectromagneticField)
    return
}

public func tfsfUpdate(_ g: Grid) -> Void {
    
    if tfsfBoundary <= 0 {
        print("tfsfUpdate: tfsfInit must be called before tfsfUpdate.\n",
              "            Boundary location must be set to positive value.\n")
        exit(-1)
    }
    hy[tfsfBoundary] -= ezInc(Double(time), location: 0.0) * chye[tfsfBoundary]
    
    ez[tfsfBoundary] += ezInc(Double(time) + 0.5, location: -0.5)
    return
}
