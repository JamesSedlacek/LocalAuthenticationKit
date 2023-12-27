//
//  MockLocalAuthService.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import LocalAuthentication
import SwiftUI

@Observable
public final class MockLocalAuthService: LocalAuthServiceable {
    public let context: LAContext = .init()
    public let icon: Image
    public let isAvailable: Bool
    public var isAuthenticated: Bool
    public let onError: (Error) -> Void
    public var error: NSError?

    public func authenticate(onSuccess: @escaping () -> Void = { }) async {
        guard !isAuthenticated else { return }
        isAuthenticated = true
        print("Successfully Authenticated")
    }

    public init(icon: Image? = nil,
                isAvailable: Bool = true,
                isAuthenticated: Bool = false,
                onError: @escaping (Error) -> Void = { error in

    }) {
        self.icon = icon ?? Image(symbol: .lock)
        self.isAvailable = isAvailable
        self.isAuthenticated = isAuthenticated
        self.onError = onError
    }
}
