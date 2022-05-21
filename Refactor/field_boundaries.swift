private var tfsfBoundary: Int; 

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
private var elecFieldOldLeft = 0.0, elecFieldOldRight: Double = 0.0
private var abcCoeffLeft = 0.0, abcCoeffRight: Double = 0.0

func abcInit(_ grid: Grid) -> Void {
    initDone = true

    var temp: Double = sqrt(grid.cezh[0] * grid.chye[0])
    abcCoeffLeft = (temp - 1.0) / (temp + 1.0)

    temp = sqrt(grid.cezh[grid.electric.count - 1] * grid.chye[grid.magnetic.count - 1])
    abcCoeffRight = (temp - 1.0) / (temp + 1.0)
}

func abc(_ grid: Grid) -> Void {
    if !initDone {
        print("abcInit must be called before abc.")
        exit(-1)
    }
    
    // ABC for left hand side
    grid.electric[0] = elecFieldOldLeft + abcCoeffLeft * (grid.electric[1] - grid.electric[0])
    elecFieldOldLeft = grid.electric[1]

    // ABC for right hand side
    grid.electric[grid.electric.count - 1] = elecFieldOldRight + abcCoeffRight * (grid.electric[grid.electric.count - 2] - grid.electric[grid.electric.count - 1])
    elecFieldOldRight = grid.electric[grid.electric.count - 2]

   // grid.magnetic[grid.magnetic.count - 1] = grid.magnetic[grid.magnetic.count - 2]
}

