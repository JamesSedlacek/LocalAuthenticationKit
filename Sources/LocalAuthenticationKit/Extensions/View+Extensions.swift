//
//  View+Extensions.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

extension View {
    /// This function checks if authentication is enabled in the user defaults.
    /// If it is, it applies a local authentication providing view modifier to the view.
    /// - Parameters:
    ///   - storage: The user defaults storage to check for the authentication setting. Defaults to `UserDefaults.standard`.
    ///   - onError: The closure to be called when an error occurs during authentication. By default, it does nothing with the error.
    /// - Returns: The view with the local authentication providing view modifier applied if authentication is enabled.
    public func authenticateIfEnabled(storage: UserDefaults = .standard,
                                      onError: @escaping (Error) -> Void = {_ in }) -> some View {
        modifier(LocalAuthViewModifier(storage: storage, onError: onError))
    }
}
