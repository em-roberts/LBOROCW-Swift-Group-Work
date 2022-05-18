//
//  abctmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 16/05/2022.
//

import Foundation

private var initDone: Int = 0
private var coef0: Double = 0.0, coef1: Double = 0.0, coef2: Double = 0.0

public var ezLeft: [Double] = [0.0], ezRight: [Double] = [0.0], ezTop: [Double] = [0.0], ezBottom: [Double] = [0.0]

public var eyLeft: [Double] = [0.0], eyRight: [Double] = [0.0], exTop: [Double] = [0.0], exBottom: [Double] = [0.0]

public func abcInit(_ a: Grid) -> Void {
    var temp1: Double, temp2: Double
    
    initDone = 1
    
    if a.type == GridType.tmZGrid.rawValue {
        ezLeft = Array(repeating: 0.0, count: SizeY() * 6)
        ezRight = Array(repeating: 0.0, count: SizeY() * 6)
        ezTop = Array(repeating: 0.0, count: SizeX() * 6)
        ezBottom = Array(repeating: 0.0, count: SizeX() * 6)
        
        temp1 = sqrt(Cezh(0, 0) * Chye(0, 0))
    } else {
        eyLeft = Array(repeating: 0.0, count: (SizeY() - 1) * 6)
        eyRight = Array(repeating: 0.0, count: (SizeY() - 1) * 6)
        exTop = Array(repeating: 0.0, count: (SizeX() - 1) * 6)
        exBottom = Array(repeating: 0.0, count: (SizeX() - 1) * 6)
        
        temp1 = sqrt(Cexh(0, 0) * Chze(0, 0))
    }
    
    temp2 = 1.0 / temp1 + 2.0 + temp1
    coef0 = -(1.0 / temp1 - 2.0 + temp1) / temp2
    coef1 = -2.0 * (temp1 - 1.0 / temp1) / temp2
    coef2 = 4.0 * (temp1 + 1.0 / temp1) / temp2
    
    return
}

func abc(_ a: Grid) -> Void {
    if a.type == GridType.tmZGrid.rawValue {
        for nn in 0 ..< SizeY() {
            g.ez[0 * SizeY() + nn] = coef0 * (Ez(2, nn) + EzLeft(0, 1, nn))
                + coef1 * (EzLeft(0, 0, nn) + EzLeft(2, 0, nn)
                            - Ez(1, nn) - EzLeft(1, 1, nn))
                + coef2 * EzLeft(1, 0, nn) - EzLeft(2, 1, nn)
            
            for mm in 0 ..< 3 {
                
                ezLeft[nn * 6 + 1 * 3 + mm] = EzLeft(mm, 0, nn)
                ezLeft[nn * 6 + 0 * 3 + mm] = Ez(mm, nn)
            }
        }
        for nn in 0 ..< SizeY() {
            g.ez[(SizeX() - 1) * SizeY() + nn] = coef0 * (Ez(SizeX() - 3, nn) + EzRight(0, 1, nn))
                + coef1 * (EzRight(0, 0, nn) + EzRight(2, 0, nn)
                            - Ez(SizeX() - 2, nn) - EzRight(1, 1, nn))
                + coef2 * EzRight(1, 0, nn) - EzRight(2, 1, nn)
            
            for mm in 0 ..< 3 {
                ezRight[nn * 6 + 1 * 3 + mm] = EzRight(mm, 0, nn)
                ezRight[nn * 6 + 0 * 3 + mm] = Ez(SizeX() - 1 - mm, nn)
            }
        }
        for mm in 0 ..< SizeX() {
            g.ez[mm * SizeY() + 0] = coef0 * (Ez(mm, 2) + EzBottom(0, 1, mm))
                + coef1 * (EzBottom(0, 0, mm) + EzBottom(2, 0, mm)
                            - Ez(mm, 1) + EzBottom(1, 1, mm))
                + coef2 * EzBottom(1, 0, mm) - EzBottom(2, 1, mm)
            
            for nn in 0 ..< 3 {
                ezBottom[nn * 6 + 1 * 3 + mm] = EzBottom(nn, 0, mm)
                ezBottom[nn * 6 + 0 * 3 + mm] = Ez(mm, nn)
            }
        }
        for mm in 0 ..< SizeX() {
            g.ez[mm * SizeY() + (SizeY() - 1)] = coef0 * (Ez(mm, SizeY() - 3) + EzTop(0, 1, mm))
                + coef1 * (EzTop(0, 0, mm) + EzTop(2, 0, mm)
                            - Ez(mm, SizeY() - 2) - EzTop(1, 1, mm))
                + coef2 * EzTop(1, 0, mm) - EzTop(2, 1, mm)
            
            for nn in 0 ..< 3 {
                ezTop[nn * 6 + 1 * 3 + mm] = EzTop(nn, 0, mm)
                ezTop[nn * 6 + 0 * 3 + mm] = Ez(mm, SizeY() - 1 - nn)
            }
        }
    } else {
        for nn in 0 ..< SizeY() - 1 {
            g.ey[0 * (SizeY() - 1) + nn] = coef0 * (Ey(2, nn) + EyLeft(0, 1, nn))
                + coef1 * (EyLeft(0, 0, nn) + EyLeft(2, 0, nn)
                            - Ey(1, nn) - EyLeft(1, 1, nn))
                + coef2 * EyLeft(1, 0, nn) - EyLeft(2, 1, nn)
        }
        
        for nn in 0 ..< 3 {
            
        }
    }
    return
}
