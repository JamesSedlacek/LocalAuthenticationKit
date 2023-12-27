//
//  LocalAuthServiceKey.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

struct LocalAuthServiceKey: EnvironmentKey {
    static let defaultValue: LocalAuthServiceable = LocalAuthService()
}

extension EnvironmentValues {
    var localAuthService: LocalAuthServiceable {
        get { self[LocalAuthServiceKey.self] }
        set { self[LocalAuthServiceKey.self] = newValue }
    }
}
