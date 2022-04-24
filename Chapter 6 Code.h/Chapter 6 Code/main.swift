
//  Created by Jack Murdoch on 09/04/2022.
//


//Progress -> Completed Chapter 6, Fixing Snapshot


import Foundation

var currentElectromagneticField = Grid()

gridInit(maxTime: 450, courantNumber: 1.0, sizeX: 200)
abcInit(currentElectromagneticField)
tfsfInit(currentElectromagneticField)
snapshotInit(currentElectromagneticField)

for time in 0 ..< maxTime {
    updateH(currentElectromagneticField)
    tfsfUpdate(currentElectromagneticField)
    updateE(currentElectromagneticField)
    abc(currentElectromagneticField)
    snapshotAppend(currentElectromagneticField)
}

snapshotWrite()




