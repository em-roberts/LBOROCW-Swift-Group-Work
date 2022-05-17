//
//  fdtd-grid h.swift
//  2D FDTD Base
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

public enum GridType: Int {
    case oneDGrid = 0
    case teZGrid = 1
    case tmZGrid = 2
    case threeDGrid = 3
}

public struct Grid {
    var hx: [Double] = [], chxh: [Double] = [], chxe: [Double] = []
    var hy: [Double] = [], chyh: [Double] = [], chye: [Double] = []
    var hz: [Double] = [], chzh: [Double] = [], chze: [Double] = []
    var ex: [Double] = [], cexe: [Double] = [], cexh: [Double] = []
    var ey: [Double] = [], ceye: [Double] = [], ceyh: [Double] = []
    var ez: [Double] = [], ceze: [Double] = [], cezh: [Double] = []
    var sizeX: Int = 0, sizeY: Int = 0, sizeZ: Int = 0
    var time: Int = 0, maxTime = 0
    var type: Int
    var cdtds: Double = 0.0
}


