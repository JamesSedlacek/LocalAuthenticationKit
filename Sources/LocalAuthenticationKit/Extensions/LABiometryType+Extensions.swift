//
//  LABiometryType+Extensions.swift
//  
//
//  Created by James Sedlacek on 12/26/23.
//

import LocalAuthentication
import SwiftUI

extension LABiometryType {
    var icon: Image {
        switch self {
        case .none:
            Image(symbol: .lock)
        case .touchID:
            Image(symbol: .touchid)
        case .faceID:
            Image(symbol: .faceid)
        case .opticID:
            Image(symbol: .opticid)
        @unknown default:
            fatalError("Unknown LABiometryType")
        }
    }
}
