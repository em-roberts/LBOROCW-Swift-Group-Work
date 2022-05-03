//
//  main.swift
//  Chapter 6
//
//  Created by (s) Damien Sorrell on 03/05/2022.
//

import Foundation

var epsr = 9.0
func gridInit() -> {
    var imp0 = 377.0
    var mm = 0
    var SizeX = 200
    var MaxTime = 450
    var CourantNumber = 1.0
    
    for i in mm ..< (SizeX - 1) {
        chyh[mm] = 1.0
        chye[mm] = 1.0/imp0
    }
    for i in mm ..< (SizeX) {
        if mm < 100 {
            ceze[mm] = 1.0
            cezh[mm]  imp0
            
        } else {
            ceze[mm] = 1.0
            cezh[mm] = imp0/epsr
        }
    }
    
    
}
