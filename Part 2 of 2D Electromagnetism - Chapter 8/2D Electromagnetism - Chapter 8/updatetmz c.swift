//
//  updatetmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func updateH2d(_ g: Grid) -> Void {
    var temp = g
    if g.type == GridType.oneDGrid.rawValue {
        for mm in 0 ..< g.sizeX - 1 {
            temp.hy[mm] = temp.chyh[mm] * temp.hy[mm]
                + temp.chye[mm] * (temp.ez[mm + 1] - temp.ez[mm])
        }
    } else {
        for mm in 1 ..< g.sizeX {
            for nn in 1 ..< g.sizeY - 1 {
                temp.hx[twoD(mm, nn, nnEnd: g.sizeY - 1)] = temp.chxh[twoD(mm, nn, nnEnd: g.sizeY - 1)] * temp.hx[twoD(mm, nn, nnEnd: g.sizeY - 1)]
                    - temp.chxe[twoD(mm, nn, nnEnd: g.sizeY - 1)] * (temp.ez[twoD(mm, nn + 1, nnEnd: g.sizeY - 1)] - temp.ez[twoD(mm, nn, nnEnd: g.sizeY - 1)])
            }
        }
        for mm in 1 ..< g.sizeX - 1 {
            for nn in 1 ..< g.sizeY {
                temp.hy[twoD(mm, nn, nnEnd: g.sizeY)] = temp.chyh[twoD(mm, nn, nnEnd: g.sizeY)] * temp.hy[twoD(mm, nn, nnEnd: g.sizeY)]
                    + temp.chye[twoD(mm, nn, nnEnd: g.sizeY)] * (temp.ez[twoD(mm + 1, nn, nnEnd: g.sizeY)] - temp.ez[twoD(mm, nn, nnEnd: g.sizeY)])
            }
        }
    }
    return
}

public func updateE2d(_ g: Grid) -> Void {
    var temp = g
    if g.type == GridType.oneDGrid.rawValue {
        for mm in 1 ..< g.sizeX - 1 {
            temp.ez[mm] = temp.ceze[mm] * temp.ez[mm]
                + temp.cezh[mm] * (temp.hy[mm] - temp.hy[mm - 1])
        }
    } else {
        for mm in 1 ..< g.sizeX - 1 {
            for nn in 1 ..< g.sizeY - 1 {
                temp.ez[twoD(mm, nn, nnEnd: g.sizeY - 1)] = temp.ceze[twoD(mm, nn, nnEnd: g.sizeY - 1)] * temp.ez[twoD(mm, nn, nnEnd: g.sizeY - 1)] +
                    temp.cezh[twoD(mm, nn, nnEnd: g.sizeY - 1)] * ((temp.hy[twoD(mm, nn, nnEnd: g.sizeY - 1)] - temp.hy[twoD(mm, nn, nnEnd: g.sizeY - 1)]) -
                                                                    (temp.hx[twoD(mm, nn, nnEnd: g.sizeY - 1)] - temp.hx[twoD(mm, nn, nnEnd: g.sizeY - 1) - 1]))
            }
        }
    }
    return
}
