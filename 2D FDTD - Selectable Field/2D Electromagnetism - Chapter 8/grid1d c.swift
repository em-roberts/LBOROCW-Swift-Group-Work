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
    
    for nn in 0 ..< SizeY() {
        g1[nn].sizeX = SizeX() + nLoss
        g1[nn].type = GridType.oneDGrid.rawValue
        
        if Type() == GridType.tmZGrid.rawValue {
            g1[nn].hy = Array(repeating: 0.0, count: SizeX1(nn) - 1)
            g1[nn].chyh = Array(repeating: 0.0, count: SizeX1(nn) - 1)
            g1[nn].chye = Array(repeating: 0.0, count: SizeX1(nn) - 1)
            g1[nn].ez = Array(repeating: 0.0, count: SizeX1(nn))
            g1[nn].cezh = Array(repeating: 0.0, count: SizeX1(nn))
            g1[nn].ceze = Array(repeating: 0.0, count: SizeX1(nn))
            
            for mm in 0 ..< SizeX1(nn) - 1 {
                if mm < SizeX1(nn) - 1 - nLoss {
                    g1[nn].ceze[mm] = 1.0
                    g1[nn].cezh[mm] = Cdtds() * imp0
                    g1[nn].chyh[mm] = 1.0
                    g1[nn].chye[mm] = Cdtds() / imp0
                } else {
                    depthInLayer = Double(mm - (SizeX() - 1 - nLoss)) + 0.5
                    lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                    g1[nn].ceze[mm] = (1.0 - lossFactor) / (1.0 + lossFactor)
                    g1[nn].cezh[mm] = Cdtds() * imp0 / (1.0 + lossFactor)
                    depthInLayer += 0.5
                    lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                    g1[nn].chyh[mm] = (1.0 - lossFactor) / (1.0 * lossFactor)
                    g1[nn].chye[mm] = Cdtds() / imp0 / (1.0 + lossFactor)
                }
            }
        } else {
            g1[nn].hz = Array(repeating: 0.0, count: SizeX1(nn) - 1)
            g1[nn].chzh = Array(repeating: 0.0, count: SizeX1(nn) - 1)
            g1[nn].chze = Array(repeating: 0.0, count: SizeX1(nn) - 1)
            g1[nn].ey = Array(repeating: 0.0, count: SizeX1(nn))
            g1[nn].ceyh = Array(repeating: 0.0, count: SizeX1(nn))
            g1[nn].ceye = Array(repeating: 0.0, count: SizeX1(nn))
            
            for mm in 0 ..< SizeX1(nn) - 1 {
                if mm < SizeX1(nn) - 1 - nLoss {
                    g1[nn].ceye[mm] = 1.0
                    g1[nn].ceyh[mm] = Cdtds() * imp0
                    g1[nn].chzh[mm] = 1.0
                    g1[nn].chze[mm] = Cdtds() / imp0
                } else {
                    depthInLayer += 0.5
                    lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                    g1[nn].ceye[mm] = (1.0 - lossFactor) / (1.0 + lossFactor)
                    g1[nn].ceyh[mm] = Cdtds() * imp0 / (1.0 + lossFactor)
                    depthInLayer += 0.5
                    lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
                    g1[nn].chzh[mm] = (1.0 - lossFactor) / (1.0 * lossFactor)
                    g1[nn].chze[mm] = Cdtds() / imp0 / (1.0 + lossFactor)
                }
            }
        }
    }
    return
}


