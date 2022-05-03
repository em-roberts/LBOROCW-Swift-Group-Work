//
//  6.3.swift
//  Chapter 6
//
//  Created by (s) Damien Sorrell on 03/05/2022.
//

import Foundation

private var initDone = 0
private var ezOldRight = 0.0
private var ezOldLeft = 0.0
private var abcCoefLeft = 0.0
private var abcCoefRight = 0.0

func abcInit() {
    var temp = 0.0
    initDone = 1
    temp = sqrt(cezh[0] * chye[0])
    abcCoefLeft = (temp - 1.0)/(temp + 1.0)
    temp = sqrt(cezh[SizeX - 1] * chye[SizeX - 2])
    abcCoefRight = (temp - 1.0)/(temp + 1.0)
}

func abc() {
    if ((initDone == 0)) {
        print("abcInit must be called first")
        exit(-1)
    }
    ez[0] = ezOldLeft + abcCoefLeft * (ez[1] - ez[0])
    ezOldLeft = ez[1]
    ez[SizeX - 1] = ezOldRight + abcCoefRight * (ez[SizeX - 2] - ez[SizeX - 1])
    ezOldRight = ez[SizeX - 2]
}

