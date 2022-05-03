//
//  6.4.swift
//  Chapter 6
//
//  Created by (s) Damien Sorrell on 03/05/2022.
//

import Foundation

private var initDone = 0

func abcInit() {
    initDone = 1
    var temp1 = sqrt(cezh[0] * chye[0])
    var temp2 = 1.0 / temp1 + 2.0 + temp1
    abcCoefLeft[0] = -(1.0/temp1 - 2.0 + temp1) / temp2
    abcCoefLeft[1] = -2.0 * (temp1 - 1.0 / temp1) / temp2
    abcCoefLeft[2] = 4.0 * (temp1 + 1.0 / temp1) / temp2
    
    temp1 = sqrt(cezh[SizeX - 1] * chye[SizeX - 2])
    temp2 = 1.0 / temp1 + 2.0 + temp1
    abcCoefRight[0] = -(1.0/temp1 - 2.0 + temp1) / temp2
    abcCoefRight[1] = -2.0 * (temp1 - 1.0 / temp1) / temp2
    abcCoefRight[2] = 4.0 * (temp1 + 1.0 / temp1) / temp2
    
}

func abc() {
    var mm = 0
    if (initDone == 0) {
        print("abcInit must be called first")
        exit(-1)
    }
    ez[0] = abcCoefLeft[0] * (ez[2] + ezOldLeft2[0]) +
    abcCoefLeft[1] * (ezOldLeft1[0] + ezOldLeft1[2] -
    ez[1] - ezOldLeft2[2])
    + abcCoefLeft[2] * ezOldLeft1[1] - ezOldLeft[2]
    
    ez[SizeX -1] =
        abcCoefRight[0] * (ez[SizeX - 3] + ezOldRight2[0])
        + abcCoefRight[1] * (ezOldRight1[0] + ezOldRight1[2] -
        ez[SizeX - 2] - ezOldRight2[1]) + abcCoefRight[2] * ezOldRight1[1] - ezOldRight2[2]
    
    for i in mm ..< 3 {
        ezOldLeft2[mm] = ezOldLeft1[mm]
        ezOldLeft1[mm] = ez[mm]
        
        ezOldRight2[mm] = ezOldRight1[mm]
        ezOldRight1[mm] = ez[SizeX - 1 - mm]
    }

    
}
