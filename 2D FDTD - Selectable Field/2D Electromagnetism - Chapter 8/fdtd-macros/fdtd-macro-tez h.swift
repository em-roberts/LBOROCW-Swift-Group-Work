//
//  fdtd-macro-tez h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

public func Hz(_ m: Int, _ n: Int) -> Double {
    return g.hz[(m) * (SizeY() - 1) + (n)]
}
public func Chzh(_ m: Int, _ n: Int) -> Double {
    return g.chzh[(m) * (SizeY() - 1) + (n)]
}
public func Chze(_ m: Int, _ n: Int) -> Double {
    return g.chze[(m) * (SizeY() - 1) + (n)]
}

public func Ex(_ m: Int, _ n: Int) -> Double {
    return g.ex[(m) * SizeY() + (n)]
}
public func Cexe(_ m: Int, _ n: Int) -> Double {
    return g.cexe[(m) * SizeY() + (n)]
}
public func Cexh(_ m: Int, _ n: Int) -> Double {
    return g.cexh[(m) * SizeY() + (n)]
}
public func Ey(_ m: Int, _ n: Int) -> Double {
    return g.ey[(m) * (SizeY() - 1) + (n)]
}
public func Ceye(_ m: Int, _ n: Int) -> Double {
    return g.ceye[(m) * (SizeY() - 1) + (n)]
}
public func Ceyh(_ m: Int, _ n: Int) -> Double {
    return g.ceyh[(m) * (SizeY() - 1) + (n)]
}


public func Hz1 (_ m: Int, _ nn: Int) -> Double {
    return g1[nn].hz[m]
}
public func Chzh1 (_ m: Int, _ nn: Int) -> Double {
    return g1[nn].chzh[m]
}
public func Chze1 (_ m: Int, _ nn: Int) -> Double {
    return g1[nn].chze[m]
}

public func Ey1 (_ m: Int, _ nn: Int) -> Double {
    return g1[nn].ey[m]
}
public func Ceye1 (_ m: Int, _ nn: Int) -> Double {
    return g1[nn].ceye[m]
}
public func Ceyh1 (_ m: Int, _ nn: Int) -> Double {
    return g1[nn].ceyh[m]
}
