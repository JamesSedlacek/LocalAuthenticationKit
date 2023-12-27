//
//  MockLocalAuthService.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import LocalAuthentication
import SwiftUI

@Observable
public final class MockLocalAuthService: LocalAuthServiceable {
    let context: LAContext = .init()
    let icon: Image
    let isAvailable: Bool
    var isAuthenticated: Bool
    let onError: (Error) -> Void
    var error: NSError?

    func authenticate() async {
        guard !isAuthenticated else { return }
        isAuthenticated = true
        print("Successfully Authenticated")
    }

    public init(icon: Image? = nil,
                isAvailable: Bool = true,
                isAuthenticated: Bool = false,
                onError: @escaping (Error) -> Void = { error in

    }) {
        self.icon = icon ?? Image(symbol: .faceid)
        self.isAvailable = isAvailable
        self.isAuthenticated = isAuthenticated
        self.onError = onError
    }
}
