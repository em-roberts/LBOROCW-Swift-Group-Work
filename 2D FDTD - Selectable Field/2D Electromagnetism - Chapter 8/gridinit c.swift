//
//  gridtmz c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 03/05/2022.
//

import Foundation

public func gridInit() -> Void {

    let imp0: Double = 377.0
    var fieldType: Int = 0
    
    print(" What field is the particle induced in?\n",
          "Type: '1' - for a magnetic field\n",
          "      '2' - for an electric field")
    fieldType = Int(readLine() ?? "0") ?? 0
    if fieldType == 1 {
        g.type = GridType.tmZGrid.rawValue
    } else if fieldType == 2 {
        g.type = GridType.teZGrid.rawValue
    } else {
        print("\ngridInit: Either '1' or '2' must be inputted when selecting a field")
        exit(-1)
    }
    print("\n","Input the size of the field in the x direction.")
    g.sizeX = Int(readLine() ?? "0") ?? 0
    print(" Input the size of the field in the y direction.")
    g.sizeY = Int(readLine() ?? "0") ?? 0
    print(" Input the maximum value for time")
    g.maxTime = Int(readLine() ?? "0") ?? 0
    g.cdtds = 1.0 / sqrt(2.0)
    
    if Type() == 1 {
        
        var rad: Double = 0.0, r2: Double = 0.0,
            xLocation: Double = 0.0, yLocation: Double = 0.0,
            xCenter: Double = 0.0, yCenter: Double = 0.0
        
        g.hz = Alloc2D(SizeX() - 1, SizeY() - 1)
        g.chzh = Alloc2D(SizeX() - 1, SizeY() - 1)
        g.chze = Alloc2D(SizeX() - 1, SizeY() - 1)
        
        g.ex = Alloc2D(SizeX() - 1, SizeY())
        g.cexh = Alloc2D(SizeX() - 1, SizeY())
        g.cexe = Alloc2D(SizeX() - 1, SizeY())
        
        g.ey = Alloc2D(SizeX(), SizeY() - 1)
        g.ceye = Alloc2D(SizeX(), SizeY() - 1)
        g.ceyh = Alloc2D(SizeX(), SizeY() - 1)
        
        for mm in 0 ..< SizeX() - 1 {
            for nn in 0 ..< SizeY() {
                g.cexe[mm * SizeY() + nn] = 1.0
                g.cexh[mm * SizeY() + nn] = Cdtds() * imp0
            }
        }
        
        for mm in 0 ..< SizeX() {
            for nn in 0 ..< SizeY() - 1 {
                g.ceye[mm * (SizeY() - 1) + nn] = 1.0
                g.ceyh[mm * (SizeY() - 1) + nn] = Cdtds() * imp0
            }
        }
        
        rad = 12
        xCenter = Double(SizeX()) / 2.0
        yCenter = Double(SizeY()) / 2.0
        r2 = rad * rad
        for mm in 1 ..< SizeX() - 1 {
            xLocation = Double(mm) - xCenter
            for nn in 1 ..< SizeY() - 1 {
                yLocation = Double(nn) - yCenter
                if (xLocation) * (xLocation) + (yLocation) * (yLocation) < r2 {
                    g.cexe[mm * SizeY() + nn] = 0.0
                    g.cexh[mm * SizeY() + nn] = 0.0
                    g.cexe[mm * SizeY() + nn + 1] = 0.0
                    g.cexh[mm * SizeY() + nn + 1] = 0.0
                    g.ceye[mm * (SizeY() - 1) + nn] = 0.0
                    g.ceyh[mm * (SizeY() - 1) + nn] = 0.0
                    g.ceye[(mm + 1) * (SizeY() - 1) + nn] = 0.0
                    g.ceyh[(mm + 1) * (SizeY() - 1) + nn] = 0.0
                }
            }
        }
        
        for mm in 0 ..< SizeX() - 1 {
            for nn in 0 ..< SizeY() - 1 {
                g.chzh[mm * (SizeY() - 1) + nn] = 1.0
                g.chze[mm * (SizeY() - 1) + nn] = Cdtds() / imp0
            }
        }
        
    } else {
        g.hx = Alloc2D(SizeX(), SizeY() - 1)
        g.chxh = Alloc2D(SizeX(), SizeY() - 1)
        g.chxe = Alloc2D(SizeX(), SizeY() - 1)
        
        g.hy = Alloc2D(SizeX() - 1, SizeY())
        g.chyh = Alloc2D(SizeX() - 1, SizeY())
        g.chye = Alloc2D(SizeX() - 1, SizeY())
        
        g.ez = Alloc2D(SizeX(), SizeY())
        g.ceze = Alloc2D(SizeX(), SizeY())
        g.cezh = Alloc2D(SizeX(), SizeY())
        
        for mm in 0 ..< SizeX() {
            for nn in 0 ..< SizeY() {
                g.ceze[mm * SizeY() + nn] = 1.0
                g.cezh[mm * SizeY() + nn] = Cdtds() * imp0
            }
        }
        
        for mm in 0 ..< SizeX() {
            for nn in 0 ..< SizeY() - 1 {
                g.chxh[mm * (SizeY() - 1) + nn] = 1.0
                g.chxe[mm * (SizeY() - 1) + nn] = Cdtds() / imp0
            }
        }
        
        for mm in 0 ..< SizeX() - 1 {
            for nn in 0 ..< SizeY() {
                g.chyh[mm * SizeY() + nn] = 1.0
                g.chye[mm * SizeY() + nn] = Cdtds() / imp0
            }
        }
    }
    return
}
