//
//  tempFix.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 22/05/2022.
//

import Foundation

public func edgeAdjustment() -> Void {
    if Type() == GridType.tmZGrid.rawValue {
        for i in 0 ..< SizeX() {
            g.ez[i * SizeY() + 0] = 0.0
            g.ez[i * SizeY() + (SizeY() - 1)] = 0.0
        }
        for j in 0 ..< SizeY() {
            g.ez[0 * SizeY() + j] = 0.0
            g.ez[(SizeX() - 1) * SizeY() + j] = 0.0
        }
    } else {
        for i in 0 ..< SizeX() - 1 {
            g.hz[i * (SizeY() - 1) + 0] = 0.0
            g.hz[i * (SizeY() - 1) + (SizeY() - 2)] = 0.0
        }
        for j in 0 ..< SizeY() - 1 {
            g.hz[0 * (SizeY() - 1) + j] = 0.0
            g.hz[(SizeX() - 2) * (SizeY() - 1) + j] = 0.0
        }
    }
}
