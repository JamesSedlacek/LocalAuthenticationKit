//
//  Image+Extensions.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import SwiftUI

extension Image {
    enum SFSymbol: String {
        case lock
        case lockOpen = "lock.open"
        case lockSlash = "lock.slash"
        case faceid
        case touchid
        case opticid
    }

    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
