//
//  main.swift
//  2D FDTD Base
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

var g = Grid(hx: [], chxh: [], chxe: [],
             hy: [], chyh: [], chye: [],
             hz: [], chzh: [], chze: [],
             ex: [], cexe: [], cexh: [],
             ey: [], ceye: [], ceyh: [],
             ez: [], ceze: [], cezh: [],
             sizeX: 0, sizeY: 0, sizeZ: 0,
             time: 0, maxTime: 0,
             type: 0,
             cdtds: 0)

gridInit()
ezIncInit()
snapshotInit()

for t in 0 ..< g.maxTime {
    g.time = t
    updateH2d(g)
    updateE2d(g)
    g.ez[(SizeX() / 2) * SizeY() + (SizeY() / 2)] = ezInc(Time(), location: 0.0)
    snapshotWrite(g)
}

snapshotUpload()
