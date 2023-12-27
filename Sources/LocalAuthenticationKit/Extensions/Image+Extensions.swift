//
//  Image+Extensions.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import SwiftUI

extension Image {
enum SFSymbol: String {
    case faceid
    case lock
    case opticid
    case questionmark
    case touchid
}

    init(symbol: SFSymbol) {
        self.init(systemName: symbol.rawValue)
    }
}
