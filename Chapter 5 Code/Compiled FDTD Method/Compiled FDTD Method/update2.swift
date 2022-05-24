//
//  update2.swift
//  Compiled FDTD Method
//
//  Created by (s) Liam Street on 10/05/2022.
//

import Foundation

public func updateH (_ g: Grid) -> Void {
    for mm in 0 ..< size-1 {
        hy[mm] = chyh[mm] * hy[mm] + chye[mm] * (ez[mm+1] - ez[mm])
    }
    return
}

public func updateE (_ g: Grid) -> Void {
    for mm in 1 ..< size-1 {
        ez[mm] = ceze[mm] * ez[mm] + cezh[mm] * (hy[mm] - hy[mm-1])
    }
    return
}
