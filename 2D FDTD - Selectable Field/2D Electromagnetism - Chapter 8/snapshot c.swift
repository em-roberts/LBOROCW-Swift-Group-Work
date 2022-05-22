//
//  snapshot c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 09/05/2022.
//

import Foundation

let date = Date() // to ID run by execution time and avoid overwriting previous files
let pathToFile = NSHomeDirectory()

public func Snapshot() -> Void {
    let writeFilename = pathToFile + "/snapshot_" + date.description + " " + g.time.description + ".dat"

    let fileHasBeenWritten = FileManager.default.createFile(atPath: writeFilename, contents: nil, attributes: nil)
    print("File has been created at", g.time, "s")

    if fileHasBeenWritten {
        do {
            var outputText = String()
            
            if Type() == GridType.tmZGrid.rawValue {
                for i in 0 ..< SizeX() {
                    for j in 0 ..< SizeY() {
                        outputText.append(i.description)
                        outputText.append("\t")
                        outputText.append(j.description)
                        outputText.append("\t")
                        outputText.append(g.ez[i * SizeY() + j].description)
                        outputText.append("\n")
                    }
                }
            } else {
                for i in 0 ..< SizeX() - 1 {
                    for j in 0 ..< SizeY() - 1 {
                        outputText.append(i.description)
                        outputText.append("\t")
                        outputText.append(j.description)
                        outputText.append("\t")
                        outputText.append(g.hz[i * (SizeY() - 1) + j].description)
                        outputText.append("\n")
                    }
                }
            }
        
            outputText.append("\n")
            try outputText.write(toFile: writeFilename, atomically: false, encoding: .utf8)
        } catch {
        }
        print(writeFilename)
    }
    return
}
