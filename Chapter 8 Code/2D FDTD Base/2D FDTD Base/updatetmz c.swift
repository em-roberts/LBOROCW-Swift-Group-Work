//
//  updatetmz c.swift
//  2D FDTD Base
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

public func updateH2d(_ a: Grid) -> Void {
    if a.type == GridType.oneDGrid.rawValue {
        for mm in 0 ..< SizeX() - 1 {
            g1.hy[mm] = Chyh1(mm) * Hy1(mm)
                + Chye1(mm) * (Ez1(mm + 1) - Ez1(mm))
        }
    } else {
        for mm in 0 ..< SizeX() {
            for nn in 0 ..< SizeY() - 1 {
                g.hx[mm * (SizeY() - 1) + nn] = Chxh(mm, nn) * Hx(mm, nn)
                    - Chxe(mm, nn) * (Ez(mm, nn + 1) - Ez(mm, nn))
            }
        }
        for mm in 0 ..< temp.sizeX - 1 {
            for nn in 0 ..< temp.sizeY{
                temp.hy[mm * SizeY() + nn] = Chyh(mm, nn) * Hy(mm, nn)
                    + Chye(mm, nn) * (Ez(mm + 1, nn) - Ez(mm, nn))
            }
        }
    }
    return
}

public func updateE2d(_ a: Grid) -> Void {
    if a.type == GridType.oneDGrid.rawValue {
        for mm in 1 ..< SizeX() - 1 {
            g1.ez[mm] = Ceze1(mm) * Ez1(mm)
                + Cezh1(mm) * (Hy1(mm) - Hy1(mm - 1))
        }
    } else {
        for mm in 1 ..< SizeX() - 1 {
            for nn in 1 ..< SizeY() - 1 {
                g.ez[mm * SizeY() + nn] = Ceze(mm, nn) * Ez(mm, nn) +
                    Cezh(mm, nn) * ((Hy(mm, nn) - Hy(mm - 1, nn)) -
                                        (Hx(mm, nn) - Hx(mm, nn - 1)))
            }
        }
    }
    return
}
