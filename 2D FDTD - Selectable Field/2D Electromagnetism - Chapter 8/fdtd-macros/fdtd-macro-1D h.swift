//
//  fdtd-macro-1D h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

public func Hy1 (_ m: Int) -> Double {
    return g1.hy[m]
}
public func Chyh1 (_ m: Int) -> Double {
    return g1.chyh[m]
}
public func Chye1 (_ m: Int) -> Double {
    return g1.chye[m]
}

public func Ez1 (_ m: Int) -> Double {
    return g1.ez[m]
}
public func Ceze1 (_ m: Int) -> Double {
    return g1.ceze[m]
}
public func Cezh1 (_ m: Int) -> Double {
    return g1.cezh[m]
}
