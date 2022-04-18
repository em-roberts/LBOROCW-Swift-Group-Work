
//  Created by Jack Murdoch on 9/04/2022.
//

import Foundation

public struct Grid {
    var ez: [Double] = [], ceze: [Double] = [], cezh: [Double] = []
    var hy: [Double] = [], chye: [Double] = [], chyh: [Double] = []
    var size = 0
    var time = 0, maxTime = 0
    var courantNumber = 0.0
}

public var ez = currentElectromagneticField.ez
public var ceze = currentElectromagneticField.ceze
public var cezh = currentElectromagneticField.cezh

public var hy = currentElectromagneticField.hy
public var chye = currentElectromagneticField.chye
public var chyh = currentElectromagneticField.chyh

public var size = currentElectromagneticField.size
public var time = currentElectromagneticField.time
public var courantNumber = currentElectromagneticField.courantNumber
public var maxTime = currentElectromagneticField.maxTime
