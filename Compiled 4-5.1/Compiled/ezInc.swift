//
//  ezInc.swift
//  Compiled
//
//  Created by (s) Damien Sorrell on 17/05/2022.
//

import Foundation

private var cdtds: Double = 0.0
private var delay: Double = 0.0
private var width: Int = 0

public func ezIncInit (_ g: Grid) -> Void {
    cdtds = courantNumber
    print("Enter the delay")
    delay = Double(readLine() ?? "0") ?? 0
    print ("Enter the width")
    width = Int(readLine() ?? "0") ?? 0
    return
}

public func ezInc (_ time: Double, location: Double) -> Double {
    if width <= 0 {
        print("ezInc: Must call ezIncInit before ezInc\n")
        exit(-1)
    }
    return exp(-pow((time - delay - location / cdtds) / Double(width), 2))
}
