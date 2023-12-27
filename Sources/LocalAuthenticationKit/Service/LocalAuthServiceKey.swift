//
//  LocalAuthServiceKey.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

public struct LocalAuthServiceKey: EnvironmentKey {
    static let defaultValue: LocalAuthServiceable = LocalAuthService()
}

public extension EnvironmentValues {
    var localAuthService: LocalAuthServiceable {
        get { self[LocalAuthServiceKey.self] }
        set { self[LocalAuthServiceKey.self] = newValue }
    }
}
