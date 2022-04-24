
//  Created by Jack Murdoch on 09/04/2022.
//


//Progress -> Completed Chapter 6
//Snapshot Works? (Need to check .dat file but passes error check)


import Foundation

var currentElectromagneticField = Grid()

gridInit(maxTime: 450, courantNumber: 1.0, sizeX: 200)
abcInit(currentElectromagneticField)
tfsfInit(currentElectromagneticField)
snapshotInit(currentElectromagneticField)

for t in 0 ..< maxTime {
    time = t
    updateH(currentElectromagneticField)
    tfsfUpdate(currentElectromagneticField)
    updateE(currentElectromagneticField)
    abc(currentElectromagneticField)
    snapshotAppend(currentElectromagneticField)
}

snapshotWrite()




