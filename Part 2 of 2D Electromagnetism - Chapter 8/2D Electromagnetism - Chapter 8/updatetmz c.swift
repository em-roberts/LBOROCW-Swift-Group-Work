//
//  updatetmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func updateH2d(_ g: Grid) -> Void {
    var temp = g
    if temp.type == GridType.oneDGrid.rawValue {
        for mm in 0 ..< g.sizeX - 1 {
            temp.hy[mm] = temp.chyh[mm] * temp.hy[mm]
                + temp.chye[mm] * (temp.ez[mm + 1] - temp.ez[mm])
        }
    } else {
        for mm in 1 ... temp.sizeX {
            for nn in 1 ... temp.sizeY - 1 {
                temp.hx[twoD(mm, nn)] = temp.chxh[twoD(mm, nn)] * temp.hx[twoD(mm, nn)]
                    - temp.chxe[twoD(mm, nn)] * (temp.ez[twoD(mm, nn + 1)] - temp.ez[twoD(mm, nn)])
            }
        }
        for mm in 1 ... temp.sizeX {
            for nn in 1 ... temp.sizeY - 1{
                temp.hy[twoD(mm, nn)] = temp.chyh[twoD(mm, nn)] * temp.hy[twoD(mm, nn)]
                    + temp.chye[twoD(mm, nn)] * (temp.ez[twoD(mm, nn + 1)] - temp.ez[twoD(mm, nn)])
            }
        }
    }
    return
}

public func updateE2d(_ g: Grid) -> Void {
    var temp = g
    if temp.type == GridType.oneDGrid.rawValue {
        for mm in 1 ..< temp.sizeX - 1 {
            temp.ez[mm] = temp.ceze[mm] * temp.ez[mm]
                + temp.cezh[mm] * (temp.hy[mm] - temp.hy[mm - 1])
        }
    } else {
        for mm in 2 ... temp.sizeX - 1 {
            for nn in 2 ... temp.sizeY - 1 {
                temp.ez[twoD(mm, nn)] = temp.ceze[twoD(mm, nn)] * temp.ez[twoD(mm, nn)] +
                    temp.cezh[twoD(mm, nn)] * ((temp.hy[twoD(mm, nn)] - temp.hy[twoD(mm - 1, nn)]) -
                                                                    (temp.hx[twoD(mm, nn)] - temp.hx[twoD(mm, nn - 1) ]))
            }
        }
    }
    return
}
