//
//  gridInit.swift
//  Compiled
//
//  Created by (s) Damien Sorrell on 17/05/2022.
//

import Foundation

public let LOSS = 0.0253146
public let lossLayer = 100
public let EPSR = 9.0
let imp0 = 377.0


 /*func gridInit3(maxTime: Int, courantNumber: Double, SizeX: Int) {
        
    
    currentElectromagneticField.SizeX = SizeX
    currentElectromagneticField.maxTime = maxTime
    currentElectromagneticField.courantNumber = courantNumber
 
    currentElectromagneticField.ez = [Double](repeating: 0.0, count: SizeX)
    currentElectromagneticField.ceze = [Double](repeating: 0.0, count: SizeX)
    currentElectromagneticField.cezh = [Double](repeating: 0.0, count: SizeX)
    currentElectromagneticField.hy = [Double](repeating: 0.0, count: SizeX-1)
    currentElectromagneticField.chye = [Double](repeating: 0.0, count: SizeX-1)
    currentElectromagneticField.chyh = [Double](repeating: 0.0, count: SizeX-1)

 
     let imp0 = 377.0
    for mm in 0 ..< SizeX {
         if mm < 100 {
             ceze[mm] = 1.0
             cezh[mm] = imp0
         } else {
             ceze[mm] = (1.0 - LOSS) / (1.0 + LOSS)
             cezh[mm] = imp0 / EPSR / (1.0 + LOSS)
         }
     }
    for mm in 0 ..< SizeX - 1 {
             chyh[mm] = 1.0
             chye[mm] = 1.0 / imp0
         }
     return
 }
 */


 
 public func gridInit3(maxTime: Int, courantNumber: Double, SizeX: Int) -> Void {
     
     currentElectromagneticField.SizeX = SizeX
     currentElectromagneticField.maxTime = maxTime
     currentElectromagneticField.courantNumber = courantNumber
     
     currentElectromagneticField.ez = [Double](repeating: 0.0, count: SizeX)
     currentElectromagneticField.ceze = [Double](repeating: 0.0, count: SizeX)
     currentElectromagneticField.cezh = [Double](repeating: 0.0, count: SizeX)
     currentElectromagneticField.hy = [Double](repeating: 0.0, count: SizeX-1)
     currentElectromagneticField.chye = [Double](repeating: 0.0, count: SizeX-1)
     currentElectromagneticField.chyh = [Double](repeating: 0.0, count: SizeX-1)
     
     for mm in 0 ..< SizeX {
         if mm < 100 {
             ceze[mm] = 1.0
             cezh[mm] = imp0
         } else {
             ceze[mm] = 1.0
             cezh[mm] = imp0 / EPSR
         }
     }
     for mm in 0 ..< SizeX - 1 {
         chyh[mm] = 1.0
         chye[mm] = 1.0/imp0
     }
     
     return
 }
 
