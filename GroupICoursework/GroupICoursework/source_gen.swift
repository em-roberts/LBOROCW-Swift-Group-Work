import Foundation

/* global variables -- but private to this file */
private var delay: Double = 0.0, width: Double = 0.0
private var pointsPerWavelength: Double = 0.0 

/* prompt user for source-function width and delay. */

func ezIncInit(_ grid: Grid) -> Void {
    /*
    print("Enter delay:")
    delay = Double(readLine() ?? "0") ?? 0
    print("Enter width:")
    width = Double(readLine() ?? "0") ?? 0
    */
    print("Enter the points per wavelength:")
    pointsPerWavelength = Double(readLine() ?? "0") ?? 0
}

/* calculate source function at given time and location */
func ezInc(time: Double, location: Double, grid: Grid) -> Double {
    if (pointsPerWavelength <= 0) { //chnge from width to ppw
        print("ezInc: must call ezIncInit before ezInc.\nPoints per wavelength must be positive.")
        exit(-1)
    }
    // return exp(-pow((time - delay - location / grid.cdtds) / width, 2))
    return sin(2.0 * Double.pi / pointsPerWavelength * (grid.courantNumber * time - location))
}

