//
//  grid1dez c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 11/05/2022.
//

import Foundation

public let nLoss: Int = 20
public let maxLoss = 0.35

public func gridInit1d() -> Void {
    let imp0: Double = 377.0
    var depthInLayer: Double = 0.0, lossFactor: Double = 0.0
    
    g1.sizeX = SizeX() + nLoss
    g1.type = GridType.oneDGrid.rawValue
    
    if Type() == GridType.tmZGrid.rawValue {
        g1.hy = Array(repeating: 0.0, count: SizeX1() - 1)
        g1.chyh = Array(repeating: 0.0, count: SizeX1() - 1)
        g1.chye = Array(repeating: 0.0, count: SizeX1() - 1)
        g1.ez = Array(repeating: 0.0, count: SizeX1())
        g1.cezh = Array(repeating: 0.0, count: SizeX1())
        g1.ceze = Array(repeating: 0.0, count: SizeX1())
        
        for mm in 0 ..< SizeX1() - 1 {
            if mm < SizeX1() - 1 - nLoss {
                g1.ceze[mm] = 1.0
                g1.cezh[mm] = Cdtds() * imp0
                g1.chyh[mm] = 1.0
                g1.chye[mm] = Cdtds() / imp0
            } else {
                depthInLayer = Double(mm - (SizeX() - 1 - nLoss)) + 0.5
                lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                g1.ceze[mm] = (1.0 - lossFactor) / (1.0 + lossFactor)
                g1.cezh[mm] = Cdtds() * imp0 / (1.0 + lossFactor)
                depthInLayer += 0.5
                lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                g1.chyh[mm] = (1.0 - lossFactor) / (1.0 * lossFactor)
                g1.chye[mm] = Cdtds() / imp0 / (1.0 + lossFactor)
            }
        }
    } else {
        g1.hz = Array(repeating: 0.0, count: SizeX1() - 1)
        g1.chzh = Array(repeating: 0.0, count: SizeX1() - 1)
        g1.chze = Array(repeating: 0.0, count: SizeX1() - 1)
        g1.ey = Array(repeating: 0.0, count: SizeX1())
        g1.ceyh = Array(repeating: 0.0, count: SizeX1())
        g1.ceye = Array(repeating: 0.0, count: SizeX1())
        
        for mm in 0 ..< SizeX1() - 1 {
            if mm < SizeX1() - 1 - nLoss {
                g1.ceye[mm] = 1.0
                g1.ceyh[mm] = Cdtds() * imp0
                g1.chzh[mm] = 1.0
                g1.chze[mm] = Cdtds() / imp0
            } else {
                depthInLayer += 0.5
                lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                g1.ceye[mm] = (1.0 - lossFactor) / (1.0 + lossFactor)
                g1.ceyh[mm] = Cdtds() * imp0 / (1.0 + lossFactor)
                depthInLayer += 0.5
                lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                g1.chzh[mm] = (1.0 - lossFactor) / (1.0 * lossFactor)
                g1.chze[mm] = Cdtds() / imp0 / (1.0 + lossFactor)
            }
        }
    }
    return
}


