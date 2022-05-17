//
//  fdtd-macro-tmz h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

public func Hx (_ m: Int, _ n: Int) -> Double {
    return g.hx[m * (SizeY() - 1) + n]
}
public func Chxh (_ m: Int, _ n: Int) -> Double {
    return g.chxh[m * (SizeY() - 1) + n]
}
public func Chxe (_ m: Int, _ n: Int) -> Double {
    return g.chxe[m * (SizeY() - 1) + n]
}

public func Hy (_ m: Int, _ n: Int) -> Double {
    return g.hy[m * SizeY() + n]
}
public func Chyh (_ m: Int, _ n: Int) -> Double {
    return g.chyh[m * SizeY() + n]
}
public func Chye (_ m: Int, _ n: Int) -> Double {
    return g.chye[m * SizeY() + n]
}
public func Ez (_ m: Int, _ n: Int) -> Double {
    return g.ez[m * SizeY() + n]
}
public func Ceze (_ m: Int, _ n: Int) -> Double {
    return g.ceze[m * SizeY() + n]
}
public func Cezh (_ m: Int, _ n: Int) -> Double {
    return g.cezh[m * SizeY() + n]
}

public func SizeX() -> Int {
    return g.sizeX
}
public func SizeY() -> Int {
    return g.sizeY
}
public func sizeZ() -> Int {
    return g.sizeZ
}
public func Time() -> Int {
    return g.time
}
public func MaxTime() -> Int {
    return g.maxTime
}
public func Cdtds() -> Double {
    return g.cdtds
}
public func Type() -> Int {
    return g.type
}

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


