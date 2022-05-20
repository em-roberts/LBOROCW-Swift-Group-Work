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

        ceze = [Double](repeating: 1.0, count: electric.count)
        cezh = [Double](repeating: impedence, count: electric.count)
        chye = [Double](repeating: 1.0, count: magnetic.count)
        chyh = [Double](repeating: 1.0 / impedence, count: magnetic.count)

        for index in 0 ..< electric.count {
            if index < 100 {
                ceze[index] = 1.0
                cezh[index] = impedence
            } else if index < LOSS_LAYER {
                ceze[index] = 1.0
                cezh[index] = impedence / 9.0
            } else {
                ceze[index] = (1.0 - LOSS) / (1.0 + LOSS)
                cezh[index] = impedence / 9.0 / (1.0 + LOSS)
            }
        }

        for index in 0 ..< magnetic.count {
            if (index < LOSS_LAYER) {
                chyh[index] = 1.0;
                chye[index] = 1.0 / impedence
            } else {
                chyh[index] = (1.0 - LOSS) / (1.0 + LOSS);
                chye[index] = 1.0 / impedence / (1.0 + LOSS);
            }
        }

        // relativePermittivity = [Double](repeating: 1.0, count: size)

        // for i in 100 ..< size { 
        // 	relativePermittivity[i] = 9.0
        // } 
    }

    func step(timeStep: Int) -> Void {

        // ABC
        // magnetic[magnetic.count] = magnetic[magnetic.count - 1]

        for index in 0 ..< magnetic.count {
            magnetic[index] = chyh[index] * magnetic[index] + chye[index] * (electric[index + 1] - electric[index])
        }

        // Magnetic correction
        magnetic[49] -= exp(-(timeStep - 30.) * (timeStep - 30.) / 100.) / impedence

        // ABC
        electric[0] = electric[1]

        for index in 1 ..< magnetic.count {
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
