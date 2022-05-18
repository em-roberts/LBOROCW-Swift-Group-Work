//
//  snapshot c.swift
//  2D Electromagnetism - Chapter 8
//
//  Created by (s) Jack Murdoch on 09/05/2022.
//

import Foundation

private var writeFileName: String = ""
private var outputText: String = ""

public func snapshotInit () -> Void {
    let date = Date()
    let filePath = NSHomeDirectory()
    //Currently uploads to a .txt file
    writeFileName = filePath + "/snapshot " + date.description + ".dat"
    
    if (FileManager.default.createFile(atPath: writeFileName, contents: nil, attributes: nil)) {
        print("File successfully created")
    } else {
        print("An error occured when creating the file")
    }
    return
}

public func snapshotWrite (_ g: Grid) -> Void {
    
    if writeFileName == "" {
        print("snapshotAppend: snapshotInit must be called before snapshotWrite")
        exit(-1)
    }
    
    if Type() == GridType.tmZGrid.rawValue {
        for i in 0 ..< SizeX() {
            for j in 0 ..< SizeY() {
                outputText.append(g.time.description)
                outputText.append("\t")
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
                outputText.append(g.time.description)
                outputText.append("\t")
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

    return
}

public func snapshotUpload() -> Void {
    
    if outputText == "" {
        print("snapshotWrite: snapshotWrite must be called before snapshotUpload")
        exit(-1)
    }
    
    do {
        
        try outputText.write(toFile: writeFileName, atomically: false, encoding: .utf8)
        
    } catch {
        
    }
    print("Data has been uploaded to file")
    return
}
