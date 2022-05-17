//
//  Harmonic 1 .swift
//  GroupICoursework
//
//  Created by (s) Kelsey Roe on 17/05/2022.
//

import Foundation

public var amp = 0.0
public var phase = 0.0

public func harmonicInit1(theAmp: Double, thePhase:Double) -> Void {
    amp = theAmp
    phase = thePhase
}

public func harmonic1(x:Double) -> Double {
    return amp * cos(x + phase)
}
