import Foundation

private var writeFileName: String = ""
private var outputText: String = ""

public func snapshotInit () -> Void {
    let date = Date()
    let filePath = NSHomeDirectory()
    writeFileName = filePath + "/snapshot " + date.description + ".dat"
    
    if (FileManager.default.createFile(atPath: writeFileName, contents: nil, attributes: nil)) {
        print("\n","File successfully created")
    } else {
        print("An error occured when creating the file")
    }
    return
}

func snapshotWrite (_ grid: Grid, timeStep: Int) -> Void {
    if writeFileName == "" {
        print("snapshotAppend: snapshotInit must be called before snapshotWrite")
        exit(-1)
    }
    for i in 0 ..< grid.electric.count {
        outputText.append(timeStep.description)
        outputText.append("\t")
        outputText.append(i.description)
        outputText.append("\t")
        outputText.append(grid.electric[i].description)
        outputText.append("\n")
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
    } catch {}
    print("\n","Data has been uploaded to file\n",
        writeFileName)
    return
}
