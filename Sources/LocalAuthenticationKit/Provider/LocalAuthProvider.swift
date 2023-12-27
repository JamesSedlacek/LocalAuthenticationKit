//
//  LocalAuthProvider.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import Foundation

@Observable
public final class LocalAuthProvider: LocalAuthProviding {
    private static let localAuthKey = "isLocalAuthEnabled"
    private let userDefaults: UserDefaults

    /// A property that checks if local authentication is enabled or not.
    /// It uses the user defaults to store and retrieve the value.
    var isEnabled: Bool {
        /// Getter for the isEnabled property.
        /// It accesses the isEnabled key path and returns the value from the user defaults.
        get {
            access(keyPath: \.isEnabled)
            return userDefaults.bool(forKey: Self.localAuthKey) 
        }
        /// Setter for the isEnabled property.
        /// It sets the value in the user defaults for the isEnabled key path.
        set {
            withMutation(keyPath: \.isEnabled) {
                userDefaults.set(newValue, forKey: Self.localAuthKey)
            }
        }
    }

    public init(storage: UserDefaults = .standard) {
        self.userDefaults = storage
    }
}
