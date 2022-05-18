//
//  abc-tmz functions h.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 18/05/2022.
//

import Foundation

public func EzLeft(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezLeft[(n) * 6 + (q) * 3 + (m)]
}
public func EzRight(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezRight[(n) * 6 + (q) * 3 + (m)]
}
public func EzTop(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezTop[(m) * 6 + (q) * 3 + (n)]
}
public func EzBottom(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return ezBottom[(m) * 6 + (q) * 3 + (n)]
}


public func EyLeft(_ m: Int, _ q: Int, _ n: Int) -> Double {
    return eyLeft[(n) * 6 + (q) * 3 + (m)]
}
public func EyRight(_ m: Int, _ q: Int, _ n: Int) -> Double {
    return eyRight[(n) * 6 + (q) * 3 + (m)]
}
public func ExTop(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return exTop[(m) * 6 + (q) * 3 + (n)]
}
public func ExBottom(_ m: Int,_ q: Int,_ n: Int) -> Double {
    return exBottom[(m) * 6 + (q) * 3 + (n)]
}
