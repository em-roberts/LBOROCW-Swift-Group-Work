
//  Created by Jack Murdoch on 24/04/2022.
//

import Foundation

let epsr: Double = 9.0

public func gridInit(maxTime: Int, courantNumber: Double, sizeX: Int) -> Void {
    let imp0: Double = 377.0
    
    currentElectromagneticField.size = sizeX
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
    
    currentElectromagneticField.ez = [Double](repeating: 0.0, count: sizeX)
    currentElectromagneticField.ceze = [Double](repeating: 0.0, count: sizeX)
    currentElectromagneticField.cezh = [Double](repeating: 0.0, count: sizeX)
    currentElectromagneticField.hy = [Double](repeating: 0.0, count: sizeX-1)
    currentElectromagneticField.chye = [Double](repeating: 0.0, count: sizeX-1)
    currentElectromagneticField.chyh = [Double](repeating: 0.0, count: sizeX-1)
    
    for mm in 0 ..< sizeX {
        if mm < 100 {
            ceze[mm] = 1.0
            cezh[mm] = imp0
        } else {
            ceze[mm] = 1.0
            cezh[mm] = imp0/epsr
        }
    }
    for mm in 0 ..< sizeX-1 {
        chyh[mm] = 1.0
        chye[mm] = 1.0/imp0
    }
    
    return
}
