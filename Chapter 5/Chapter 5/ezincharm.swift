//
//  File.swift
//  Chapter 5
//
//  Created by (s) Liam Street on 15/05/2022.
//

//#include "ezinc3.swift"
//Global variables -- but private to this file
var ppw = 0.0
func ezIncInit(Grid) {
    var cdtds = Cdtds
    print("Enter points per wavelength:")
    var ppw = readLine()
    return

}
func ezInc(time: Double, location: Double){
    if ppw <= 0{
        print(stderr,
              "ezInc: must call ezIncInit before ezInc.\n",
                "       Point per wavelength must be positive. \n")
    }
    return sin(2.0 * M_PI / ppw * (cdtds * time - location))
}
