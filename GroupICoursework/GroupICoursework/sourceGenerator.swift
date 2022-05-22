import Foundation

private var pointsPerWavelength: Double = 0.0


func ezIncidenceInit(_ grid: Grid) -> Void {

    print("Enter the points per wavelength:")
    pointsPerWavelength = Double(readLine() ?? "0") ?? 0
}

/* calculate source function at given time and location */
func ezIncidence(time: Double, location: Double, grid: Grid) -> Double {
    if (pointsPerWavelength <= 0) {
        print("ezIncidence: must call ezIncidenceInit before ezIncidence.\nPoints per wavelength must be positive.")
        exit(-1)
    }

    return sin(2.0 * Double.pi / pointsPerWavelength * (grid.courantNumber * time - location))
}

