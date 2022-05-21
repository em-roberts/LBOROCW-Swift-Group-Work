//
//  main.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
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
abcInit(g)
tfsfInit(g)

print("\n","At what point in time should the data be recorded?")
let timeRead = Int(readLine() ?? "0") ?? 0

for time in 0 ..< MaxTime() {
    updateH2d(g)
    tfsfUpdate(g)
    updateE2d(g)
    abc(g)
    if time == timeRead {
        Snapshot()
        exit(-1)
    }
}

