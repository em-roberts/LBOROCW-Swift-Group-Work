//
//  Program 4.9.swift
//  Chapter 4
//
//  Created by (s) Damien Sorrell on 29/03/2022.
//

import Foundation

var amp = 0.0
var phase = 0.0
func harmonicInit2() { // (improved) initialisation function
    print("Enter the Amplitude")
    amp = Double(readLine() ?? "0") ?? 0
    print("Enter the phase in degrees: ")
    phase = Double(readLine() ?? "0") ?? 0
    phase *= Double.pi / 180 //phase differene in radians
}
func harmonic2(x: Double) -> Double {
    return amp * cos(x + phase)
}
