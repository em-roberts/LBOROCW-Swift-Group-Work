//
//  tfsftmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 10/05/2022.
//

import Foundation

private var firstX: Int = 0, firstY: Int = 0,
            lastX: Int = 0, lastY: Int = 0

public var g1 = Grid(hx: [0.0], chxh: [0.0], chxe: [0.0],
                     hy: [0.0], chyh: [0.0], chye: [0.0],
                     hz: [0.0], chzh: [0.0], chze: [0.0],
                     ex: [0.0], cexe: [0.0], cexh: [0.0],
                     ey: [0.0], ceye: [0.0], ceyh: [0.0],
                     ez: [0.0], ceze: [0.0], cezh: [0.0],
                     sizeX: 0, sizeY: 0, sizeZ: 0,
                     time: 0, maxTime: 0,
                     type: 0,
                     cdtds: 0.0)

public func tfsfInit(_ a: Grid) -> Void {
    
    gridInit1d()
    
    print("\n","Grid is", g.sizeX, "by", g.sizeY, "cell")
    
    print("\n","Enter indicies for first point in TF region \n",
          "x:")
    firstX = (Int(readLine() ?? "0") ?? 0) - 1
    print(" y:")
    firstY = (Int(readLine() ?? "0") ?? 0) - 1
    
    print("\n","Enter indicies for last point in TF region\n",
          "x:")
    lastX = (Int(readLine() ?? "0") ?? 0) - 1
    print(" y:")
    lastY = (Int(readLine() ?? "0") ?? 0) - 1
    
    if firstX <= 0 || firstY <= 0 || lastX >= (SizeX() - 1) || lastY >= (SizeY() - 1) {
        print("tfsfInit: TF region cannot cross the boundary of the field")
        print(SizeX() - 1, SizeY() - 1)
        exit(-1)
    }
    
    ezIncInit()
    
    return
}

public func tfsfUpdate(_ a: Grid) -> Void {
    var mm: Int = 0, nn: Int = 0
    
    if firstX <= 0 {
        print("tfsfUpdate: tfsfInit must be called before tfsfUpdate.\n",
              "            Boundary location must be set to positive value")
        exit(-1)
    }
    
    if Type() == GridType.tmZGrid.rawValue {
        mm = firstX - 1
        for nn in firstY ..< lastY {
            g.hy[mm * SizeY() + nn] -= Chyh(mm, nn) * Ez1(mm + 1)
        }
        mm = lastX
        for nn in firstY ..< lastY {
            g.hy[mm * SizeY() + nn] += Chye(mm, nn) * Ez1(mm)
        }
        
        nn = firstY - 1
        for mm in firstX ..< lastX {
            g.hx[mm * (SizeY() - 1) + nn] += Chxe(mm, nn) * Ez1(mm)
        }
        nn = lastY
        for mm in firstX ..< lastX {
            g.hx[mm * (SizeY() - 1) + nn] -= Chxe(mm, nn) * Ez1(mm)
        }
    } else {
        mm = firstX - 1
        for nn in firstY ..< lastY {
            g.hz[mm * (SizeY() - 1) + nn] += Chze(mm, nn) * Ey1(mm + 1)
        }
        mm = lastX
        for nn in firstY ..< lastY {
            g.hz[mm * (SizeY() - 1) + nn] -= Chze(mm, nn) * Ey1(mm)
        }
    }
    
    updateH2d(g1)
    updateE2d(g1)
    
    if Type() == GridType.tmZGrid.rawValue {
        g1.ez[0] = ezInc(g1.time, location: 0.0)
        g1.time += 1
        
        mm = firstX
        for nn in firstY ..< lastY {
            g.ez[mm * SizeY() + nn] -= Cezh(mm, nn) * Hy1(mm - 1)
        }
        mm = lastX
        for nn in firstY ..< lastY {
            g.ez[mm * SizeY() + nn] += Cezh(mm, nn) * Hy1(mm)
        }
    } else {
        g1.ey[0] = ezInc(g1.time, location: 0.0)
        g1.time += 1
        
        nn = firstY
        for mm in firstX ..< lastX {
            g.ex[mm * SizeY() + nn] -= Cexh(mm, nn) * Hz1(mm)
        }
        nn = lastX
        for mm in firstX ..< lastX {
            g.ex[mm * SizeY() + nn] += Cexh(mm, nn) * Hz1(mm)
        }
        mm = firstX
        for nn in firstY ..< lastY {
            g.ey[mm * (SizeY() - 1) + nn] += Ceyh(mm, nn) * Hz1(mm - 1)
        }
        mm = lastX
        for nn in firstY ..< lastY {
            g.ey[mm * (SizeY() - 1) + nn] -= Ceyh(mm, nn) * Hz1(mm)
        }
    }
    
    return
}


