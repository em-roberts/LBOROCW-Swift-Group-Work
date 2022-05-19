//
//  main.swift
//  Compiled
//
//  Created by (s) Damien Sorrell on 17/05/2022.
//

import Foundation

var currentElectromagneticField = Grid()

gridInit3(maxTime: 450, courantNumber: 1.0, SizeX: 200)
// abcInit(currentElectromagneticField)
tfsfInit(currentElectromagneticField)
snapshotInit(currentElectromagneticField)

for t in 0 ..< maxTime {
    time = t
    updateH(currentElectromagneticField)
    tfsfUpdate(currentElectromagneticField)
    // abc(currentElectromagneticField)
    updateE(currentElectromagneticField)
    snapshotAppend(currentElectromagneticField)
}

snapshotWrite()

