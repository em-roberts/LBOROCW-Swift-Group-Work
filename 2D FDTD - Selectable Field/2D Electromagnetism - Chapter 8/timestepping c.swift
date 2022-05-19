//
//  timestepping c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 18/05/2022.
//

import Foundation

private var timeStep: Double = 0.0
public var stepEnd: Int = 0

public func Round(_ value: Double) -> Int {
    if value >= Double(Int(value)) + 0.5 {
        return Int(value) + 1
    } else {
        return Int(value)
    }
}

public func timeStepInit() -> Void {
    print("\n","How many seconds should be between each recorded point?\n",
          "(Recommend to use a larger value if maxTime is large)")
    timeStep = Double(readLine() ?? "0") ?? 0
    
    if timeStep < 1 {
        print("timeStepInit: The value for timeStep must be larger than 1 s")
        exit(-1)
    }
    stepEnd = Round(Double(MaxTime()) / timeStep)
}

public func timeStep(time: Int) -> Int {
    return Round(Double(time) * timeStep)
}


