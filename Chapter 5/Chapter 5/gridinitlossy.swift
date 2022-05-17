//
//  gridinitlossy.swift
//  Chapter 5
//
//  Created by (s) Liam Street on 15/05/2022.
//
//#include "fdtd3.swift"
//#define LOSS 0.0253146
//#define LOSS_LAYER 100
//#define EPSR 4.0

func gridInit3(Grid){
    var imp0 = 377.0
    var mm = 0
    let SizeX = 200
    let MaxTime = 450
    let Cdtds = 1.0
    while mm < SizeX {
        if mm < 100 {
            Ceze(mm) = 1.0
            Cezh(mm) = imp0
        }
        else{
            Ceze(mm) = (1.0 - LOSS) / (1.0 + LOSS)
            Cezh(mm) = imp0 / EPSR / (1.0 + LOSS)
        }
        mm += 1
    }
    mm = 0
        while mm < SizeX - 1 {
            Chyh(mm) = 1.0
            Chye(mm) = 1.0 / imp0
            mm += 1
        }
    return
}

