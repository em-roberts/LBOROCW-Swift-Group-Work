//
//  abcInit.swift
//  Compiled
//
//  Created by (s) Damien Sorrell on 17/05/2022.
//

import Foundation

/* private var initDone: Int = 0
private var ezOldLeft1: [Double] = [], ezOldLeft2: [Double] = [],
            ezOldRight1: [Double] = [], ezOldRight2: [Double] = []
private var abcCoefLeft: [Double] = [], abcCoefRight: [Double] = []

public func abcInit (_ g: Grid) -> Void {
    var temp1: Double = 0.0, temp2: Double = 0.0
    
    initDone = 1
    
    ezOldLeft1 = Array(repeating: 0.0, count: 3)
    ezOldLeft2 = Array(repeating: 0.0, count: 3)
    ezOldRight1 = Array(repeating: 0.0, count: 3)
    ezOldRight2 = Array(repeating: 0.0, count: 3)
    
    abcCoefLeft = Array(repeating: 0.0, count: 3)
    abcCoefRight = Array(repeating: 0.0, count: 3)
    
    temp1 = sqrt( (cezh[0]) * (chye[0]) )
    temp2 = 1.0 / temp1 + 2.0 + temp1
    abcCoefLeft[0] = -(1.0 / temp1 - 2.0 + temp1) / temp2
    abcCoefLeft[1] = -2.0 * (temp1 - 1.0 / temp1) / temp2
    abcCoefLeft[2] = 4.0 * (temp1 + 1.0 / temp1) / temp2
    
    temp1 = sqrt( (cezh[SizeX-1]) * (chye[SizeX-2]) )
    temp2 = 1.0 / temp1 + 2.0 + temp1
    abcCoefRight[0] = -(1.0 / temp1 - 2.0 + temp1) / temp2
    abcCoefRight[1] = -2.0 * (temp1 - 1.0 / temp1) / temp2
    abcCoefRight[2] = 4.0 * (temp1 + 1.0 / temp1) / temp2
    
    return
}

public func abc (_ g:Grid) -> Void {
    if initDone != 1 {
        print("abc: abcInit must be called before abc.\n")
        exit(-1)
    }
    
    ez[0] = abcCoefLeft[0] * (ez[2] + ezOldLeft2[0])
            + abcCoefLeft[1] * (ezOldLeft1[0] + ezOldLeft1[2] - ez[1] - ezOldLeft2[1])
            + abcCoefLeft[2] * ezOldLeft1[1] - ezOldLeft2[2]
    
    ez[SizeX-1] = abcCoefRight[0] * (ez[SizeX-3] + ezOldRight2[0])
                  + abcCoefRight[1] * (ezOldRight1[0] + ezOldRight1[2]
                                       - ez[SizeX-2] - ezOldRight2[1])
                  + abcCoefRight[2] * ezOldRight1[1] - ezOldRight2[2]
    
    for mm in 0 ..< 3 {
        ezOldLeft2[mm] = ezOldLeft1[mm]
        ezOldLeft1[mm] = ez[mm]
        
        ezOldRight2[mm] = ezOldRight1[mm]
        ezOldRight1[mm] = ez[SizeX-1-mm]
    }
    return
}
*/
