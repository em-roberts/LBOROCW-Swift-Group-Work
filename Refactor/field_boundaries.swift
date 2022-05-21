private var tfsfBoundary: Int 

func tfsfInit(_ grid: Grid) -> Void {
    print("Enter the Location of the TFSF Boundary:")
    tfsfBoundary = Int(readLine() ?? "0") ?? 0 
    ezIncInit(grid)
}

func tfsfUpdate(timeStep: Int, _ grid: Grid) -> Void {
    grid.magnetic[tfsfBoundary] -= ezInc(time: timeStep, location: 0.0, grid: grid) * grid.chye[tfsfBoundary]
    grid.magnetic[tfsfBoundary + 1] += ezInc(time: timeStep + 0.5, location: -0.5, grid: grid)
}

private var initDone: Bool = false

private var elecFieldOldLeft1: [Double] = [Double](repeating: 0.0, count: 3)
private var elecFieldOldLeft2: [Double] = [Double](repeating: 0.0, count: 3)
private var elecFieldOldRight1: [Double] = [Double](repeating: 0.0, count: 3)
private var elecFieldOldRight2: [Double] = [Double](repeating: 0.0, count: 3)

private var abcCoeffLeft: [Double] = []
private var abcCoeffRight: [Double] = []

func abcInit(_ grid: Grid) -> Void {
    initDone = true

    // var temp: Double = sqrt(grid.cezh[0] * grid.chye[0])
    // abcCoeffLeft = (temp - 1.0) / (temp + 1.0)

    // temp = sqrt(grid.cezh[grid.electric.count - 1] * grid.chye[grid.magnetic.count - 1])
    // abcCoeffRight = (temp - 1.0) / (temp + 1.0)
    
    //coeffs on left
    var temp1: Double = sqrt(grid.cezh[0] * grid.Chye[0])
    var temp2: Double = 1.0 / temp1 + 2.0 + temp1
    abcCoeffLeft = [
        -(1.0 / temp1 - 2.0 + temp1) / temp2,
        -2.0 * (temp1 - 1.0 / temp1) / temp2,
         4.0 * (temp1 + 1.0 / temp1) / temp2
    ]

    // coeffs on right
    temp1 = sqrt(grid.cezh[grid.electric.count - 1] * grid.chye[grid.magnetic.count - 1])
    temp2 = 1.0 / temp1 + 2.0 + temp1
    abcCoeffRight = [
        -(1.0 / temp1 - 2.0 + temp1) / temp2,
        -2.0 * (temp1 - 1.0 / temp1) / temp2,
         4.0 * (temp1 + 1.0 / temp1) / temp2
    ]


}

func abc(_ grid: Grid) -> Void {
    if !initDone {
        print("abcInit must be called before abc.")
        exit(-1)
    }

    grid.electric[0] = abcCoeffLeft[0] * (grid.electric[2] + elecFieldOldLeft2[0])
        + abcCoeffLeft[1] * (elecFieldOldLeft1[0] + elecFieldOldLeft1[2] -
        grid.electric[1] - elecFieldOldLeft2[1])
        + abcCoeffLeft[2] * elecFieldOldLeft1[1] - elecFieldOldLeft2[2]

    /* ABC for right side of grid */
    grid.electric[grid.electric.count - 1] =
        abcCoeffRight[0] * (grid.electric[grid.electric.count - 3] + elecFieldOldRight2[0])
        + abcCoeffRight[1] * (elecFieldOldRight1[0] + elecFieldOldRight1[2] -
        grid.electric[grid.electric.count - 2] - elecFieldOldRight2[1])
        + abcCoeffRight[2] * elecFieldOldRight1[1] - elecFieldOldRight2[2]

    /* update stored fields */
    for index in 0 ..< elecFieldOldLeft1.count {
        elecFieldOldLeft2[index] = elecFieldOldLeft1[index]
        elecFieldOldLeft1[index] = grid.electric[index]
        elecFieldOldRight2[index] = elecFieldOldRight1[index]
        elecFieldOldRight1[index] = grid.electric[grid.electric.count - 1 - index]
    }

}


