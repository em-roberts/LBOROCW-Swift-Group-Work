private var tfsfBoundary: Int; 

func tfsfInit(_ grid: Grid) -> Void {
    print("Enter the Location of the TFSF Boundary:")
    tfsfBoundary = Int(readLine() ?? "0") ?? 0 
    ezIncInit(grid)
}

func tfsfUpdate(timeStep: Int, _ grid: Grid) -> Void {
    grid.magnetic[tfsfBoundary] -= ezInc(time: timeStep, location: 0.0) * grid.chye[tfsfBoundary]
    grid.magnetic[tfsfBoundary + 1] += ezInc(time: timeStep + 0.5, location: -0.5)
}

func abcInit() -> Void {}

func abc(_ grid: Grid) -> Void {
    grid.electric[0] = grid.electric[1]
    grid.magnetic[grid.magnetic.count - 1] = grid.magnetic[grid.magnetic.count - 2]
}