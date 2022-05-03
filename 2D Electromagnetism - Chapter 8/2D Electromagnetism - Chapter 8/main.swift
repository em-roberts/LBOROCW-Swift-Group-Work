//
//  main.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

var g: Grid

gridInit()
//ezIncInit()

for time in 0 ..< maxTime {
    updateH2d()
    updateE2d()
    //ez[sizeX/2][sizeY/2] = ezInc(time, location: 0.0)
}
