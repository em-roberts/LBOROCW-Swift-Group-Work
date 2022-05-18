//
//  fdtd-alloc h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 11/05/2022.
//

import Foundation

public func Alloc2D (_ m: Int,_ n: Int) -> [Double] {
    return Array(repeating: 0.0, count: (m) * (n))
}

