
//  Created by Jack Murdoch on 09/04/2022.
//

import Foundation

public let loss: Double = 0.02
public let lossLayer: Int = 180
public let espr: Double = 9.0

public func gridInit (maxTime: Int, courantNumber: Double, size: Int) -> Void {
    let imp0: Double = 377.0
    
    currentElectromagneticField.size = size
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
    
    currentElectromagneticField.ez = [Double](repeating: 0.0, count: size)
    currentElectromagneticField.ceze = [Double](repeating: 0.0, count: size)
    currentElectromagneticField.cezh = [Double](repeating: 0.0, count: size)
    currentElectromagneticField.hy = [Double](repeating: 0.0, count: size-1)
    currentElectromagneticField.chye = [Double](repeating: 0.0, count: size-1)
    currentElectromagneticField.chyh = [Double](repeating: 0.0, count: size-1)
    
    for mm in 0 ..< size {
        if mm < 100 {
            ceze[mm] = 1.0
            cezh[mm] = imp0
        } else if mm < lossLayer {
            ceze[mm] = 1.0
            cezh[mm] = imp0 / espr
        } else {
            ceze[mm] = (1.0 - loss) / (1.0 + loss)
            cezh[mm] = imp0 / espr / (1.0 + loss)
        }
    }
    for mm in 0 ..< size-1 {
        if mm < lossLayer {
            chyh[mm] = 1.0
            chye[mm] = 1.0 / imp0
        } else {
            chyh[mm] = (1.0 - loss) / (1.0 + loss)
            chye[mm] = 1.0 / imp0 / (1.0 + loss)
        }
    }
    return
}
