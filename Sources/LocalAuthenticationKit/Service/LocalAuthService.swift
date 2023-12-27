//
//  LocalAuthService.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import Foundation
import LocalAuthentication

@Observable
public final class LocalAuthService: LocalAuthServiceable {
    let context: LAContext = .init()
    let onError: (Error) -> Void
    var isAuthenticated: Bool = false
    var error: NSError?

    public init(onError: @escaping (Error) -> Void = {_ in }) {
        self.onError = onError
    }
}
