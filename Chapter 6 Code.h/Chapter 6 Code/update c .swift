
//  Created by Jack Murdoch on 09/04/2022.
//

import Foundation

public func updateH (_ g: Grid) -> Void {
    for mm in 0 ..< sizeX-1 {
        hy[mm] = chyh[mm] * hy[mm] + chye[mm] * (ez[mm+1] - ez[mm])
    }
    return
}

public func updateE (_ g: Grid) -> Void {
    for mm in 1 ..< sizeX-1 {
        ez[mm] = ceze[mm] * ez[mm] + cezh[mm] * (hy[mm] - hy[mm-1])
    }
    return
}
