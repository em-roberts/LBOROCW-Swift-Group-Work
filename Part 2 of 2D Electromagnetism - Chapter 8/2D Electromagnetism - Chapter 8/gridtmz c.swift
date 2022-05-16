//
//  gridtmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func gridInit(_ g: Grid) -> Grid {
    var temp = g
    
    let imp0: Double = 377.0
    
    temp.type = GridType.tmZGrid.rawValue
    temp.sizeX = 101
    temp.sizeY = 81
    temp.maxTime = 300
    temp.cdtds = 1.0 / sqrt(2.0)
    
    temp.hx = Array(repeating: 0.0, count: twoDSize(temp.sizeX, temp.sizeY-1))
    temp.chxh = Array(repeating: 0.0, count: twoDSize(temp.sizeX, temp.sizeY-1))
    temp.chxe = Array(repeating: 0.0, count: twoDSize(temp.sizeX, temp.sizeY-1))
    temp.hy = Array(repeating: 0.0, count: twoDSize(temp.sizeX-1, temp.sizeY))
    temp.chyh = Array(repeating: 0.0, count: twoDSize(temp.sizeX-1, temp.sizeY))
    temp.chye = Array(repeating: 0.0, count: twoDSize(temp.sizeX-1, temp.sizeY))
    temp.ez = Array(repeating: 0.0, count: twoDSize(temp.sizeX, temp.sizeY))
    temp.ceze = Array(repeating: 0.0, count: twoDSize(temp.sizeX, temp.sizeY))
    temp.cezh = Array(repeating: 0.0, count: twoDSize(temp.sizeX, temp.sizeY))
    
    for mm in 1 ... temp.sizeX {
        for nn in 1 ... temp.sizeY {
            temp.ceze[twoD(mm, nn)] = 1.0
            temp.cezh[twoD(mm, nn)] = g.cdtds * imp0
        }
    }
    
    for mm in 1 ... temp.sizeX {
        for nn in 1 ... temp.sizeY - 1 {
            temp.chxh[twoD(mm, nn)] = 1.0
            temp.chxe[twoD(mm, nn)] = g.cdtds / imp0
        }
    }
    
    for mm in 1 ... temp.sizeX - 1 {
        for nn in 1 ... temp.sizeY {
            temp.chyh[twoD(mm, nn)] = 1.0
            temp.chye[twoD(mm, nn)] = g.cdtds / imp0
        }
    }
    return temp
}
