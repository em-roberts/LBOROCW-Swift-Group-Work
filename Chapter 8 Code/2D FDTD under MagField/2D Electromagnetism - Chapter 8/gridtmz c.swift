//
//  gridtmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func gridInit() -> Void {

    let imp0: Double = 377.0
    
    g.type = GridType.tmZGrid.rawValue
    g.sizeX = 101
    g.sizeY = 81
    g.maxTime = 300
    g.cdtds = 1.0 / sqrt(2.0)
    
    g.hx = Alloc2D(SizeX(), SizeY() - 1)
    g.chxh = Alloc2D(SizeX(), SizeY() - 1)
    g.chxe = Alloc2D(SizeX(), SizeY() - 1)
    g.hy = Alloc2D(SizeX() - 1, SizeY())
    g.chyh = Alloc2D(SizeX() - 1, SizeY())
    g.chye = Alloc2D(SizeX() - 1, SizeY())
    g.ez = Alloc2D(SizeX(), SizeY())
    g.ceze = Alloc2D(SizeX(), SizeY())
    g.cezh = Alloc2D(SizeX(), SizeY())
    
    for mm in 0 ..< SizeX() {
        for nn in 0 ..< SizeY() {
            g.ceze[mm * SizeY() + nn] = 1.0
            g.cezh[mm * SizeY() + nn] = Cdtds() * imp0
        }
    }
    
    for mm in 0 ..< SizeX() {
        for nn in 0 ..< SizeY() - 1 {
            g.chxh[mm * (SizeY() - 1) + nn] = 1.0
            g.chxe[mm * (SizeY() - 1) + nn] = Cdtds() / imp0
        }
    }
    
    for mm in 0 ..< SizeX() - 1 {
        for nn in 0 ..< SizeY() {
            g.chyh[mm * SizeY() + nn] = 1.0
            g.chye[mm * SizeY() + nn] = Cdtds() / imp0
        }
    }
    return
}
