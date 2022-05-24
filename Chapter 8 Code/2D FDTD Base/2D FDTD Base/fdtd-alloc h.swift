//
//  fdtd-alloc h.swift
//  2D FDTD Base
//
//  Created by (s) Jack Murdoch on 17/05/2022.
//

import Foundation

public func Alloc2D (_ m: Int,_ n: Int) -> [Double] {
    return Array(repeating: 0.0, count: m * SizeY() + n)
}
