let maxTime: Int = 450
let LOSS: Double = 0.02 
let LOSS_LAYER: Int = 180

class Field {
    let size: Int
    var electric: [Double]
    var magnetic: [Double]

    var ceze: [Double]
    var cezh: [Double]
    var chyh: [Double]
    var chye: [Double]

    // var relativePermittivity: [Double]
    let impedence: Double = 377.0

    init(size: Int) {
        self.size = size
        electric = [Double](repeating: 0.0, count: size)
        magnetic = [Double](repeating: 0.0, count: size - 1)

        ceze = [Double](repeating: 1.0, count: size)
        cezh = [Double](repeating: impedence, count: size)
        chye = [Double](repeating: 0.0, count: size - 1)
        chyh = [Double](repeating: 0.0, count: size - 1)
        
        for index in 0 ..< size {
            if index < 100 {
                ceze[mm] = (1.0 - LOSS) / (1.0 + LOSS)
                cezh[mm] = impedence / 9.0 / (1.0 + LOSS)
            } else if index < LOSS_LOSS_LAYER {
                
            } else {
                ceze[mm] = (1.0 - LOSS) / (1.0 + LOSS)
                cezh[mm] = impedence / 9.0 / (1.0 + LOSS)
            }
        }

        // relativePermittivity = [Double](repeating: 1.0, count: size)

        // for i in 100 ..< size { 
        // 	relativePermittivity[i] = 9.0
        // } 
    }

    func step(timeStep: Int) -> Void {

        // ABC
        magnetic[size - 1] = magnetic[size - 2]

        for index in 0 ..< size - 1 {
            magnetic[index] = magnetic[index] + (electric[index + 1] - electric[index]) / impedence
        }

        // Magnetic correction
        magnetic[49] -= exp(-(timeStep - 30.) * (timeStep - 30.) / 100.) / impedence

        // ABC
        electric[0] = electric[1]

        for index in 1 ..< size - 1 {
            electric[index] = ceze[index] * electric[index] + cezh[index] * (magnetic[index] - magnetic[index - 1]) // * impedence / relativePermittivity[index]
        }

        // Electric correction
        electric[50] += exp(-(timeStep + 0.5 - (-0.5) - 30.) * (timeStep + 0.5 - (-0.5) - 30.) / 100.)

    }
}

var field: Field = Field(200)

// Main
snapshotInit()
for i in 0 ..< maxTime {
    field.step(timeStep: i)
    if (i % 10 == 0) { // modulo operator
        snapshotWrite(field, timeStep: i)
    }
}
snapshotUpload()
