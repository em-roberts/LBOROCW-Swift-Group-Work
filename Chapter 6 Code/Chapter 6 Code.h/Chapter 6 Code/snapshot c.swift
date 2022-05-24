
//  Created by Jack Murdoch on 18/04/2022.
//

import Foundation

private var writeFileName: String = ""
private var outputText: String = ""

public func snapshotInit (_ g: Grid) -> Void {
    let date = Date()
    let filePath = NSHomeDirectory()
    writeFileName = filePath + "/snapshot" + date.description + ".dat"
    
    if (FileManager.default.createFile(atPath: writeFileName, contents: nil, attributes: nil)) {
        print("File successfully created")
    } else {
        print("An error occured when creating the file")
    }
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
