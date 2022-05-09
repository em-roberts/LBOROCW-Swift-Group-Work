//
//  gridtmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func gridInit() -> Void {
    let imp0: Double = 377.0
    
    type = GridType.tmZGrid.rawValue
    sizeX = 101
    sizeY = 81
    maxTime = 300
    cdtds = 1.0 / sqrt(2.0)
    
    hx = Array(repeating: Array(repeating: 0.0, count: sizeY-1), count: sizeX)
    chxh = Array(repeating: Array(repeating: 0.0, count: sizeY-1), count: sizeX)
    chxe = Array(repeating: Array(repeating: 0.0, count: sizeY-1), count: sizeX)
    hy = Array(repeating: Array(repeating: 0.0, count: sizeY), count: sizeX-1)
    chyh = Array(repeating: Array(repeating: 0.0, count: sizeY), count: sizeX-1)
    chye = Array(repeating: Array(repeating: 0.0, count: sizeY), count: sizeX-1)
    ez = Array(repeating: Array(repeating: 0.0, count: sizeY), count: sizeX)
    ceze = Array(repeating: Array(repeating: 0.0, count: sizeY), count: sizeX)
    cezh = Array(repeating: Array(repeating: 0.0, count: sizeY), count: sizeX)
    
    for mm in 0 ..< sizeX {
        for nn in 0 ..< sizeY {
            ceze[mm][nn] = 1.0
            cezh[mm][nn] = cdtds * imp0
        }
    }
    
    for mm in 0 ..< sizeX {
        for nn in 0 ..< sizeY - 1 {
            chxh[mm][nn] = 1.0
            chxe[mm][nn] = cdtds / imp0
        }
    }
    
    for mm in 0 ..< sizeX - 1 {
        for nn in 0 ..< sizeY {
            chyh[mm][nn] = 1.0
            chye[mm][nn] = cdtds / imp0
        }
    }
    return
}
