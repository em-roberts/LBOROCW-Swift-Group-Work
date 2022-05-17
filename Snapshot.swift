//
//  Snapshot.swift
//  Compiled
//
//  Created by (s) Damien Sorrell and Liam Street on 17/05/2022.
//

import Foundation

let date = Date()

private var writeFileName: String = ""
private var outputText: String = ""

public func snapshotInit (_ g: Grid) -> Void {
    let pathToFile = NSHomeDirectory()
    writeFileName = pathToFile + "/SuperEpicTest " + date.description + ".txt"
    
    let fileHasBeenWritten = FileManager.default.createFile(atPath: writeFileName, contents: nil, attributes: nil)
    return
}

public func snapshotAppend (_ g: Grid) -> Void {
    
    if writeFileName == "" {
        print("snapshotAppend: snapshotInit must be called before snapshotAppend")
        exit(-1)
    }
    
    for i in 0 ..< ez.count {
        outputText.append(time.description)
        outputText.append("\t")
        outputText.append(i.description)
        outputText.append("\t")
        outputText.append(ez[i].description)
        outputText.append("\n")
    }
    outputText.append("\n")
    print(ez[50])
    
    return
}

public func snapshotWrite() -> Void {
    
    if outputText == "" {
        print("snapshotWrite: snapshotAppend must be called before snapshotWrite")
        exit(-1)
    }
    
    do {
        
        try outputText.write(toFile: writeFileName, atomically: false, encoding: .utf8)
        
    } catch {
        
    }
    return
}
