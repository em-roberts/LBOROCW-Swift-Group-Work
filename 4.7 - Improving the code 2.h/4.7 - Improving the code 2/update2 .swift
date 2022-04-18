//
//  update2 .swift
//  Program 4.12 - fdtd2.h
//
//  Created by Jack Murdoch on 09/04/2022.
//

import Foundation

private let imp0 = 377.0

public func updateH2 (_ g: Grid) -> Void {
    for mm in 0..<g.size - 2 {
        hy[mm] = hy[mm] + (ez[mm+1] - ez[mm]) / imp0
    }
}

public func updateE2 (_ g: Grid) -> Void {
    for mm in 1..<g.size - 1 {
        ez[mm] = ez[mm] + (hy[mm] - hy[mm-1]) * imp0
    }
}
