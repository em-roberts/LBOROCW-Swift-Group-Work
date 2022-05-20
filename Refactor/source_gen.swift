/* global variables -- but private to this file */
private var delay, width: Double = 0.0

/* prompt user for source-function width and delay. */

func ezIncInit(_ grid: Grid) -> Void {
    print("Enter delay:")
    delay = Double(readLine() ?? "0") ?? 0
    print("Enter width:")
    width = Double(readLine() ?? "0") ?? 0
}

/* calculate source function at given time and location */
ezInc(time: Double, location: Double) -> Double {
    if (width <= 0) {
        print("ezInc: must call ezIncInit before ezInc.\nWidth must be positive.")
        exit(-1)
    }
    return exp(-pow((time - delay - location / grid.cdtds) / width, 2))
}