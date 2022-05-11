//
//  tfsftmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 10/05/2022.
//

import Foundation

private var firstX: Int = 0, firstY: Int = 0,
            lastX: Int = 0, lastY: Int = 0

public func tfsfInit(_ g: Grid) -> Void {
    
    //gridInit1d()
    
    print("Grid is", g.sizeX, "by", g.sizeY, "cell")
    
    print("Enter indicies for first point in TF region")
    firstX = Int(readLine() ?? "0") ?? 0
    firstY = Int(readLine() ?? "0") ?? 0
    
    print("Enter indicies for last point in TF region")
    lastX = Int(readLine() ?? "0") ?? 0
    lastY = Int(readLine() ?? "0") ?? 0
    
    ezIncInit()
    
    return
}

public func tfsfUpdate(_ g: Grid) -> Void {
    var temp = g
    if firstX <= 0 {
        print("tfsfUpdate: tfsfInit must be called before tfsfUpdate.\n",
              "            Boundary location must be set to positive value")
        exit(-1)
    }
    
    for nn in firstY ... lastY {
        temp.hy[twoD(firstX - 1, nn, nnEnd: lastY)] -= temp.chye[twoD(firstX - 1, nn, nnEnd: lastY)] * temp.ez[firstX]
        temp.hy[twoD(lastX, nn, nnEnd: lastY)] += temp.chxe[twoD(lastX, nn, nnEnd: lastY)] * temp.ez[lastX]
    }
    for mm in firstX ... lastX {
        temp.hx[twoD(mm, firstY - 1, nnEnd: firstY - 1)] += temp.chxe[twoD(mm, firstY - 1, nnEnd: firstY - 1)] * temp.ez[mm]
        temp.hx[twoD(mm, lastY, nnEnd: lastY)] -= temp.chxe[twoD(mm, lastY, nnEnd: lastY)] * temp.ez[mm]
    }
    
    updateH2d(g)
    //work from here
}


