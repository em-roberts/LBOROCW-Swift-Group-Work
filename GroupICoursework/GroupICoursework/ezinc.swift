//
//  ezinc.swift
//  GroupICoursework
//
//  Created by (s) Emily Roberts on 20/05/2022.
//

import Foundation

var courantNumber = 1.0
var delay = 0.0
var width = 0.0

public func ezIncInit (_ g: Grid) -> Void {
    courantNumber = courant
    print("Enter the delay")
    delay = Double(readLine() ?? "0") ?? 0
    print("Enter the width")
    width = Double(readLine() ?? "0") ?? 0
}

public func ezInc (time: Double, location: Double) -> Double {
    if width <= 0 {
        print("must call ezIncInit before")
        exit(-1)
    }
    return Double(exp(-pow((maxTime - delay - location / courant) / width, 2)))
}
