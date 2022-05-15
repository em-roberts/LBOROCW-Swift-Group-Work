//
//  tfsftmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 10/05/2022.
//

import Foundation

private var firstX: Int = 0, firstY: Int = 0,
            lastX: Int = 0, lastY: Int = 0

private var g1 = Grid(hx: [0.0], chxh: [0.0], chxe: [0.0],
                     hy: [0.0], chyh: [0.0], chye: [0.0],
                     hz: [0.0], chzh: [0.0], chze: [0.0],
                     ex: [0.0], cexe: [0.0], cexh: [0.0],
                     ey: [0.0], ceye: [0.0], ceyh: [0.0],
                     ez: [0.0], ceze: [0.0], cezh: [0.0],
                     sizeX: 0, sizeY: 0, sizeZ: 0,
                     time: 0, maxTime: 0,
                     type: 0,
                     cdtds: 0.0)

public func tfsfInit(_ g: Grid) -> Void {
    
    g1 = gridInit1d(g1)
    
    print("Grid is", g.sizeX, "by", g.sizeY, "cell")
    
    print("Enter indicies for first point in TF region")
    firstX = 1//Int(readLine() ?? "0") ?? 0
    firstY = 1//Int(readLine() ?? "0") ?? 0
    
    print("Enter indicies for last point in TF region")
    lastX = 101//Int(readLine() ?? "0") ?? 0
    lastY = 81//Int(readLine() ?? "0") ?? 0
    
    ezIncInit()
    
    return
}

public func tfsfUpdate(_ g: Grid) -> Void {
    temp = g
    
    if firstX <= 0 {
        print("tfsfUpdate: tfsfInit must be called before tfsfUpdate.\n",
              "            Boundary location must be set to positive value")
        exit(-1)
    }
    for nn in firstY ... lastY {
        temp.hy[twoD(firstX, nn)] -= temp.chyh[twoD(firstX, nn)] * g1.ez[firstX+1]
        if nn != lastY {
            temp.hy[twoD(lastX, nn)] += temp.chyh[twoD(lastX, nn)] * g1.ez[lastX]
        }
    }
    for mm in firstX ... lastX {
        temp.hx[twoD(mm, firstY)] += temp.chxe[twoD(mm, firstY)] * g1.ez[mm]
        temp.hx[twoD(mm, lastY - 1)] -= temp.chxe[twoD(mm, lastY - 1)] * g1.ez[mm]
    }
    
    updateH2d(g1)
    updateE2d(g1)
    g1.ez[0] = ezInc(g1.time, location: 0.0)
    g1.time += 1
    
    for nn in firstY ... lastY {
        temp.ez[twoD(firstX, nn)] -= temp.cezh[twoD(firstX, nn)] * g1.hy[firstX-1]
        temp.ez[twoD(lastX, nn)] += temp.cezh[twoD(lastX, nn)] * g1.hy[lastX]
    }
    return
}


