//
//  main.swift
//  Chapter 8
//
//  Created by (s) Damien Sorrell on 10/05/2022.
//

import Foundation
public struct Grid {
    var hx: [Double] , hy: [Double]
    var chxh: [Double] , chyh: [Double]
    var chxe: [Double] , chye: [Double]
    var ez: [Double]
    var ceze: [Double] , cezh: [Double]
}
public let sizeX = 101
public let sizeY = 81
public let maxTime = 300
public let Cdtds = 1.0/sqrt(2.0)
var time = 0


var g = Grid(hx:[], hy:[], chxh:[], chyh:[],
             chxe:[], chye:[], ez:[], ceze: [], cezh:[] )

gridInit(g: Grid)
ezIncInit(g)
snapshotInit2d(g)

for time in time ..< maxTime {
    updateH2d(g)
    updateE2d(g)
    
    
    
}
    
    


