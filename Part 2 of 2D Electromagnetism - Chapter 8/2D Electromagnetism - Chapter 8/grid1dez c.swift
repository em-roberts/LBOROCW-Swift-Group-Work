//
//  grid1dez c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 11/05/2022.
//

import Foundation

public let nLoss: Int = 20
public let maxLoss = 0.35

public func gridInit1d(_ grid: Grid) -> Grid {
    var temp = grid
    
    let imp0: Double = 377.0
    var depthInLayer: Double = 0.0, lossFactor: Double = 0.0
    
    temp.sizeX += g.sizeX + nLoss
    temp.cdtds = g.cdtds
    temp.type = GridType.oneDGrid.rawValue
    
    temp.hy = Array(repeating: 0.0, count: temp.sizeX - 1)
    temp.chyh = Array(repeating: 0.0, count: temp.sizeX - 1)
    temp.chye = Array(repeating: 0.0, count: temp.sizeX - 1)
    temp.ez = Array(repeating: 0.0, count: temp.sizeX)
    temp.cezh = Array(repeating: 0.0, count: temp.sizeX)
    temp.ceze = Array(repeating: 0.0, count: temp.sizeX)
    
    for mm in 1 ..< temp.sizeX - 1 {
        if mm < temp.sizeX - 1 - nLoss {
            temp.ceze[mm] = 1.0
            temp.cezh[mm] = temp.cdtds * imp0
            temp.chyh[mm] = 1.0
            temp.chye[mm] = temp.cdtds / imp0
        } else {
            depthInLayer = Double(mm - (temp.sizeX - 1 - nLoss)) + 0.5
            lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
            temp.ceze[mm] = (1.0 - lossFactor) / (1.0 + lossFactor)
            temp.cezh[mm] = temp.cdtds * imp0 / (1.0 + lossFactor)
            depthInLayer += 0.5
            lossFactor = maxLoss * pow(depthInLayer / Double(nLoss), 2)
            temp.chyh[mm] = (1.0 - lossFactor) / (1.0 * lossFactor)
            temp.chye[mm] = temp.cdtds / imp0 / (1.0 + lossFactor)
        }
    }
    return temp
}

