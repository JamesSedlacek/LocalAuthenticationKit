//
//  LocalAuthService.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import Foundation
import LocalAuthentication

@Observable
public final class LocalAuthService: LocalAuthServiceable {
    public let context: LAContext = .init()
    public let onError: (Error) -> Void
    public var isAuthenticated: Bool = false
    public var error: NSError?

    public init(onError: @escaping (Error) -> Void = {_ in }) {
        self.onError = onError
    }
}
