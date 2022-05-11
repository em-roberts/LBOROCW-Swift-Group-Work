//
//  fdtd-alloc h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 11/05/2022.
//

import Foundation

public var temp = Grid(hx: [0.0], chxh: [0.0], chxe: [0.0],
                       hy: [0.0], chyh: [0.0], chye: [0.0],
                       hz: [0,0], chzh: [0,0], chze: [0,0],
                       ex: [0.0], cexe: [0.0], cexh: [0.0],
                       ey: [0.0], ceye: [0.0], ceyh: [0.0],
                       ez: [0.0], ceze: [0.0], cezh: [0.0],
                       sizeX: 0, sizeY: 0, sizeZ: 0,
                       time: 0, maxTime: 0,
                       type: 0,
                       cdtds: 0.0)

public func twoD(_ m: Int, _ n: Int, nnEnd: Int) -> Int{
    return n + m * nnEnd - 1
}

public func twoDSize(_ m: Int, _ n: Int) -> Int{
    return m * n
}



