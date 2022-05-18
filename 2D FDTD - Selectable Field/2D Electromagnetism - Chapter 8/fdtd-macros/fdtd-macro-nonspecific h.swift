//
//  fdtd-macro-nonspecific h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

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

public func SizeX1() -> Int {
    return g1.sizeX
}
