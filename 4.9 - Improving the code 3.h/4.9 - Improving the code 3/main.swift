
//  Created by Jack Murdoch on 09/04/2022.
//

import Foundation

var currentElectromagneticField = Grid()

gridInit(maxTime: 450, courantNumber: 1.0, size: 200)
abcInit(currentElectromagneticField)
tfsfInit(currentElectromagneticField)
snapshotInit(currentElectromagneticField)

for time in 0 ..< maxTime {
    updateH(currentElectromagneticField)
    tfsfUpdate(currentElectromagneticField)
    abc(currentElectromagneticField)
    updateE(currentElectromagneticField)
    snapshotAppend(currentElectromagneticField)
}

snapshotWrite()




