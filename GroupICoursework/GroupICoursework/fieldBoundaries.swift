import Foundation

private var scatteredFieldBoundary: Int = 0

func scatteredFieldBoundaryInit(_ grid: Grid) -> Void {
    print("Enter the Location of the Total-Field/ Scattered Field Boundary:")
    scatteredFieldBoundary = Int(readLine() ?? "0") ?? 0
    ezIncidenceInit(grid)
}

func scatteredFieldBoundaryUpdate(timeStep: Int, _ grid: Grid) -> Void {
    grid.magnetic[scatteredFieldBoundary] -= ezIncidence(time: Double(timeStep), location: 0.0, grid: grid) * grid.chye[scatteredFieldBoundary]
    grid.electric[scatteredFieldBoundary + 1] += ezIncidence(time: Double(timeStep) + 0.5, location: -0.5, grid: grid)
}

private var initDone: Bool = false

private var electricFieldOldLeft1: [Double] = [Double](repeating: 0.0, count: 3)
private var electricFieldOldLeft2: [Double] = [Double](repeating: 0.0, count: 3)
private var electricFieldOldRight1: [Double] = [Double](repeating: 0.0, count: 3)
private var electricFieldOldRight2: [Double] = [Double](repeating: 0.0, count: 3)

private var absorbingBoundaryCoeffLeft: [Double] = []
private var absorbingBoundaryCoeffRight: [Double] = []

func absorbingBoundaryConditionInit(_ grid: Grid) -> Void {
    initDone = true

    //coeffs on left
    var temporaryValue1: Double = sqrt(grid.cezh[0] * grid.chye[0])
    var temporaryValue2: Double = 1.0 / temporaryValue1 + 2.0 + temporaryValue1
    absorbingBoundaryCoeffLeft = [
        -(1.0 / temporaryValue1 - 2.0 + temporaryValue1) / temporaryValue2,
        -2.0 * (temporaryValue1 - 1.0 / temporaryValue1) / temporaryValue2,
         4.0 * (temporaryValue1 + 1.0 / temporaryValue1) / temporaryValue2
    ]

    // coeffs on right
    temporaryValue1 = sqrt(grid.cezh[grid.electric.count - 1] * grid.chye[grid.magnetic.count - 1])
    temporaryValue2 = 1.0 / temporaryValue1 + 2.0 + temporaryValue1
    
    absorbingBoundaryCoeffRight = [
        -(1.0 / temporaryValue1 - 2.0 + temporaryValue1) / temporaryValue2,
        -2.0 * (temporaryValue1 - 1.0 / temporaryValue1) / temporaryValue2,
         4.0 * (temporaryValue1 + 1.0 / temporaryValue1) / temporaryValue2
    ]

}

func absorbingBoundaryCondition(_ grid: Grid) -> Void {
    if !initDone {
        print("absorbingBoundaryConditionInit must be called before absorbingBoundaryCondition.")
        exit(-1)
    }

    grid.electric[0] = 
        absorbingBoundaryCoeffLeft[0] * (grid.electric[2] + electricFieldOldLeft2[0])
        + absorbingBoundaryCoeffLeft[1] * (electricFieldOldLeft1[0] + electricFieldOldLeft1[2] -
        grid.electric[1] - electricFieldOldLeft2[1])
        + absorbingBoundaryCoeffLeft[2] * electricFieldOldLeft1[1] - electricFieldOldLeft2[2]

    /* ABC for right side of grid */
    grid.electric[grid.electric.count - 1] =
        absorbingBoundaryCoeffRight[0] * (grid.electric[grid.electric.count - 3] + electricFieldOldRight2[0])
        + absorbingBoundaryCoeffRight[1] * (electricFieldOldRight1[0] + electricFieldOldRight1[2] -
        grid.electric[grid.electric.count - 2] - electricFieldOldRight2[1])
        + absorbingBoundaryCoeffRight[2] * electricFieldOldRight1[1] - electricFieldOldRight2[2]

    /* update stored fields */
    for index in 0 ..< electricFieldOldLeft1.count {
        electricFieldOldLeft2[index] = electricFieldOldLeft1[index]
        electricFieldOldLeft1[index] = grid.electric[index]
        electricFieldOldRight2[index] = electricFieldOldRight1[index]
        electricFieldOldRight1[index] = grid.electric[grid.electric.count - 1 - index]
    }

}
