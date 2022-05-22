import Foundation

let maxTime: Int = 450
let loss: Double = 0.0253146
let lossLayer: Int = 100
let relativePermittivity: Double = 9.0

class Grid {
    let size: Int
    var electric: [Double]
    var magnetic: [Double]

    var ceze: [Double] 
    var cezh: [Double]
    var chyh: [Double]
    var chye: [Double]

    var courantNumber: Double

    let impedenceOfFreeSpace: Double = 377.0

    init(size: Int, courant: Double) {
        self.size = size
        self.courantNumber = courant

        electric = [Double](repeating: 0.0, count: size)
        magnetic = [Double](repeating: 0.0, count: size - 1)

        ceze = [Double](repeating: 1.0, count: electric.count)
        cezh = [Double](repeating: impedenceOfFreeSpace, count: electric.count)
        chye = [Double](repeating: 1.0, count: magnetic.count)
        chyh = [Double](repeating: 1.0 / impedenceOfFreeSpace, count: magnetic.count)

        for index in 0 ..< electric.count {
            if index < 100 {
                ceze[index] = 1.0 
                cezh[index] = impedenceOfFreeSpace
            } else {
                 ceze[index] = 1.0 
                 cezh[index] = impedenceOfFreeSpace / relativePermittivity
            }
        }

        for index in 0 ..< magnetic.count {
                chyh[index] = 1.0
                chye[index] = 1.0 / impedenceOfFreeSpace
        }

        scatteredFieldBoundaryInit(self)
        absorbingBoundaryConditionInit(self)
    }

    func step(timeStep: Int) -> Void {
        update_magnetic()
        scatteredFieldBoundaryUpdate(timeStep: timeStep, self)
        update_electric()
        absorbingBoundaryCondition(self)
    }

    func update_electric() -> Void {
        for index in 1 ..< magnetic.count {
            electric[index] = ceze[index] * electric[index] + cezh[index] * (magnetic[index] - magnetic[index - 1]) 
        }
    }

    func update_magnetic() -> Void {
        for index in 0 ..< magnetic.count {
            magnetic[index] = chyh[index] * magnetic[index] + chye[index] * (electric[index + 1] - electric[index])
        }
    }

}

var grid: Grid = Grid(size: 200, courant: 1.0)

// Main
snapshotInit()
for i in 0 ..< maxTime {
    grid.step(timeStep: i)
    if (i % 10 == 0) { // modulo operator
        snapshotWrite(grid, timeStep: i)
    }
}
snapshotUpload()
