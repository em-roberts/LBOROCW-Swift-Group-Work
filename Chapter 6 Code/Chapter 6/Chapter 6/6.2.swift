//
//  6.2.swift
//  Chapter 6
//
//  Created by (s) Damien Sorrell on 03/05/2022.
//

import Foundation

func main() {
    var time = 0
    var g = Array(repeating: 0.0, count: SizeX)
    gridInit(g)
    abcInit(g)
    tfsfInit(g)
    snapshotInit(g)
    
    for i in time ..< MaxTime {
        updateH3(g)
        tfsfUpdate(g)
        updateE3(g)
        abc(g)
        snapshot(g)
        time+=1
    }
    return
}
