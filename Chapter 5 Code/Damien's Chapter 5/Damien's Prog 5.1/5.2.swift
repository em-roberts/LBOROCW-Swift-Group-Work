//
//  5.2.swift
//  Damien's Prog 5.2
//
//  Created by (s) Damien Sorrell on 03/05/2022.
//

import Foundation

var ppw = 0

func ezIncInit(PointsPerWavelength: Int) -> Void {
    ppw += PointsPerWavelength
    return
}

func ezInc(time: Double , location: Double) -> Double {
    if ppw <= 0 {
        print ("must call ezIncInit beforeEzInc, PointsPerWavelength must also be positive")
        exit(-1)
    }
    return sin(2.0 * pi / ppw * (CourantNumber * time - location))
    
}
