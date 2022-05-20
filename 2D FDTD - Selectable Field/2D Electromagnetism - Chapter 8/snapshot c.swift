//
//  snapshot c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 09/05/2022.
//

import Foundation

let date = Date()
let pathToFile = NSHomeDirectory()
let writeFilename = pathToFile + "/snapshot" + date.description + ".dat"
var xEnd: Int = 0, yEnd: Int = 0

let fileHasBeenWritten = FileManager.default.createFile(atPath: writeFilename, contents: nil, attributes: nil)

public func Snapshot() -> Void {
    do {
        
        var outputText = String()
        
        if Type() == GridType.tmZGrid.rawValue {
            xEnd = SizeX()
            yEnd = SizeY()
        } else {
            xEnd = SizeX() - 1
            yEnd = SizeY() - 1
        }
        for i in 0 ..< xEnd {
            for j in 0 ..< yEnd {
                outputText.append(i.description)
                outputText.append("\t")
                outputText.append(j.description)
                outputText.append("\t")
                if Type() == GridType.tmZGrid.rawValue {
                    outputText.append(g.ez[i * SizeY() + j].description)
                } else {
                    outputText.append(g.ey[i * (SizeY() - 1) + j].description)
                }
                outputText.append("\n")
            }
        }
        
        try outputText.write(toFile: writeFilename, atomically: false, encoding: .utf8)
    } catch {
    }
    print("File Created")
}
