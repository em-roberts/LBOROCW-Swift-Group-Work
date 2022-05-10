//
//  gridInit.swift
//  Chapter 8
//
//  Created by (s) Damien Sorrell on 10/05/2022.
//

import Foundation

public func twoD (_ m: Int, _ n: Int) -> Int {
    return m*n
}

func gridInit() -> Void {
    let imp0 = 377.0
    var mm = 0
    var nn = 0
    
    for indexCount in mm ..< sizeX {
        for indexCount in nn ..< sizeY {
            g.ceze[twoD(mm, nn)] = 1.0
            g.cezh[twoD(mm,nn)] = Cdtds * imp0
        }
    }
    
    for indexCount in mm ..< sizeX {
        for indexCount in nn ..< sizeY - 1 {
            g.chxh[twoD(mm, nn)] = 1.0
            g.chxe[twoD(mm,nn)] = Cdtds / imp0
        }
    }
    
    for indexCount in mm ..< sizeX - 1 {
        for indexCount in nn ..< sizeY {
            g.chyh[twoD(mm, nn)] = 1.0
            g.chye[twoD(mm,nn)] = Cdtds / imp0
        }
    }
}
