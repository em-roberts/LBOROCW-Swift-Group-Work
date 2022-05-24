//
//  improved2.swift
//  Compiled FDTD Method
//
//  Created by (s) Liam Street on 10/05/2022.
//

import Foundation


 /* Version 2 of the improved bare-bones 1D FDTD simulation. */

 
 func main() {
 
 gridInit2(g); // Make a 2D array for a grid

ezIncInit(g);

for (Time = 0; Time < MaxTime; Time++) { //time stepping
    updateH2(g)
    updateE2(g)
    Ez(0) = ezInc(Time, 0.0)
    print(Ez(50))
}
 }
