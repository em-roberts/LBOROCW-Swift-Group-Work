//
//  main.swift
//  Damien's Prog 5.1
//
//  Created by (s) Damien Sorrell on 03/05/2022.
//

import Foundation

let loss = 0.0253146
let lossLayer = 100
let epsr = 4.0

func lossyGrid() -> Void {
    let imp0 = 377.0
    for mm in 0 ..< SizeX {
        if (mm < 100) {
        ceze[mm] = 1.0
        cezh[mm] = imp0
        } else {
            ceze[mm] = (1.0-loss)/(1.0+loss)
            cezh[mm] = imp0/epsr/(1.0+loss)
        }
        }
    for mm in 0 ..< SizeX {
        chyh[mm] = 1.0
        chye[mm] = 1.0/imp0
    }
    return
}



