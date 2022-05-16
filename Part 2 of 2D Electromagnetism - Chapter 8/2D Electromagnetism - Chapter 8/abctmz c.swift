//
//  abctmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 16/05/2022.
//

import Foundation

func EzLeft(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezLeft[n * 6 + q * 3 + m]
}
func EzRight(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezRight[n * 6 + q * 3 + m]
}
func EzTop(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezTop[m * 6 + q * 3 + n]
}
func EzBottom(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezBottom[m * 6 + q * 3 + n]
}

private var initDone: Int = 0
private var coef0: Double = 0.0, coef1: Double = 0.0, coef2: Double = 0.0
private var ezLeft: [Double] = [0.0], ezRight: [Double] = [0.0], ezTop: [Double] = [0.0], ezBottom: [Double] = [0.0]

public func abcInit(_ g: Grid) -> Void {
    var temp1: Double, temp2: Double
    
    initDone = 1
    
    ezLeft = Array(repeating: 0.0, count: g.sizeY * 6)
    ezRight = Array(repeating: 0.0, count: g.sizeY * 6)
    ezTop = Array(repeating: 0.0, count: g.sizeX * 6)
    ezBottom = Array(repeating: 0.0, count: g.sizeX * 6)
    
    temp1 = sqrt(g.cezh[twoD(1, 1)] * g.chye[twoD(1, 1)])
    temp2 = 1.0 / temp1 + 2.0 + temp1
    coef0 = -(1.0 / temp1 - 2.0 + temp1)
    coef1 = -2.0 * (temp1 - 1.0 / temp1) / temp2
    coef2 = 4.0 * (temp1 + 1.0 / temp1) / temp2
    
    return
}
func abc(_ g: Grid) -> Void {
    temp = g
    
    for nn in 0 ..< temp.sizeY {
        temp.ez[twoD(1 , nn + 1)] = coef0 * (temp.ez[twoD(3, nn + 1)] + EzLeft(0, 1, nn))
            + coef1 * (EzLeft(0, 0, nn) + EzLeft(2, 0, nn)
                        - temp.ez[twoD(2, nn + 1)] - EzLeft(1, 1, nn))
            + coef2 * EzLeft(1, 0, nn) - EzLeft(2, 1, nn)
        
        for mm in 0 ..< 3 {
            ezLeft[nn * 6 + 1 * 3 + mm] = EzLeft(mm, 0, nn)
            ezLeft[nn * 6 + 0 * 3 + mm] = temp.ez[twoD(mm + 1, nn + 1)]
        }
    }
    for nn in 0 ..< temp.sizeY {
        temp.ez[twoD(temp.sizeX, nn)] = coef0 * (temp.ez[twoD(temp.sizeX - 2, nn + 1)] + EzRight(0, 1, nn))
            + coef1 * (EzRight(0, 0, nn) + EzRight(2, 0, nn)
                        - temp.ez[twoD(temp.sizeX - 1, nn + 1)] - EzRight(1, 1, nn))
            + coef2 * EzRight(1, 0, nn) - EzRight(2, 1, nn)
        
        for mm in 0 ..< 3 {
            ezRight[nn * 6 + 1 * 3 + mm] = EzRight(mm, 0, nn)
            ezRight[nn * 6 + 0 * 3 + mm] = temp.ez[twoD(temp.sizeX - mm, nn + 1)]
        }
    }
    for mm in 0 ..< temp.sizeX {
        temp.ez[twoD(mm + 1, 1)] = coef0 * (temp.ez[twoD(mm + 1, 3)] + EzBottom(0, 1, mm))
            + coef1 * (EzBottom(0, 0, mm) + EzBottom(2, 0, mm)
                        - temp.ez[twoD(mm + 1, 2)] + EzBottom(1, 1, mm))
            + coef2 * EzBottom(1, 0, mm) - EzBottom(2, 1, mm)
        
        for nn in 0 ..< 3 {
            ezBottom[nn * 6 + 1 * 3 + mm] = EzBottom(nn, 0, mm)
            ezBottom[nn * 6 + 0 * 3 + mm] = temp.ez[twoD(mm + 1, nn + 1)]
        }
    }
    for mm in 0 ..< temp.sizeX {
        temp.ez[twoD(mm + 1, temp.sizeY)] = coef0 * (temp.ez[twoD(mm + 1, temp.sizeY - 2)] + EzTop(0, 1, mm))
            + coef1 * (EzTop(0, 0, mm) + EzTop(2, 0, mm)
                        - temp.ez[twoD(mm + 1, temp.sizeY - 1)] - EzTop(1, 1, mm))
            + coef2 * EzTop(1, 0, mm) - EzTop(2, 1, mm)
        
        for nn in 0 ..< 3 {
            ezTop[nn * 6 + 1 * 3 + mm] = EzTop(nn, 0, mm)
            ezTop[nn * 6 + 0 * 3 + mm] = temp.ez[twoD(mm + 1, temp.sizeY - nn)]
        }
    }
    return
}
