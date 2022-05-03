//
//  updatetmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func updateH2d() -> Void {
    
    if type == GridType.oneDGrid.rawValue {
        for mm in 0 ..< sizeX - 1 {
            hy1[mm] = chyh1[mm] * hy1[mm]
                + chye1[mm] * (ez1[mm + 1] - ez1[mm])
        }
    } else {
        for mm in 0 ..< sizeX {
            for nn in 0 ..< sizeY - 1 {
                hx[mm][nn] = chxh[mm][nn] * hx[mm][nn]
                    - chxe[mm][nn] * (ez[mm][nn + 1] - ez[mm][nn])
            }
        }
        for mm in 0 ..< sizeX - 1 {
            for nn in 0 ..< sizeY {
                hy[mm][nn] = chyh[mm][nn] * hy[mm][nn]
                    + chye[mm][nn] * (ez[mm + 1][nn] - ez[mm][nn])
            }
        }
    }
    return
}

public func updateE2d() -> Void {
    
    if type == GridType.oneDGrid.rawValue {
        for mm in 1 ..< sizeX - 1 {
            ez1[mm] = ceze1[mm] * ez1[mm]
                + cezh1[mm] * (hy1[mm] - hy1[mm - 1])
        }
    } else {
        for mm in 1 ..< sizeX - 1 {
            for nn in 1 ..< sizeY - 1 {
                ez[mm][nn] = ceze[mm][nn] * ez[mm][nn] +
                    cezh[mm][nn] * ((hy[mm][nn] - hy[mm - 1][nn]) -
                                        (hx[mm][nn] - hx[mm][nn - 1]))
            }
        }
    }
    return
}
