//
//  File.swift
//  Chapter 5
//
//  Created by (s) Liam Street on 15/05/2022.
//

//#include "ezinc3.swift"
//Global variables -- but private to this file
var ppw = 0.0, cdtds //?????
func ezIncInit(Grid, g) {
    cdtds = cdtdsprintf("Enter points per wavelength)
    /*printf("Enter points per wavelength: @)"
    scanf(" %lf", &ppw))*/ //This code effectly is an input in C, I think Kelsey figured out how to do this, would appreciate integration of that technique into this.
    return

}
func ezInc(time: Double, location: Double){
    if ppw <= 0{
        fprintf(stderr,
                "ezInc: must call ezIncInit before ezInc.\n"
                "       Point per wavelength must be positive. \n")
        exit(-1)
    }
    return sin(2.0 * M_PI / ppw * (cdtds * time - location))
}
