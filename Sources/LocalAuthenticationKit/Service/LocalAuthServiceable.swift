//
//  LocalAuthServiceable.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import LocalAuthentication
import SwiftUI

public protocol LocalAuthServiceable: AnyObject, Observable {
    var context: LAContext { get }
    var icon: Image { get }
    var isAvailable: Bool { get }
    var isAuthenticated: Bool { get set }
    var error: NSError? { get set }
    var onError: (Error) -> Void { get }

    func authenticate(onSuccess: @escaping () -> Void) async
}

public extension LocalAuthServiceable {
    /// Represents the biometric authentication icon based on the device's biometry type.
    var icon: Image {
        context.biometryType.icon
    }

    /// Checks if the device owner authentication policy can be evaluated.
    var isAvailable: Bool {
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
    }

    /// This function is used to authenticate the user.
    /// It first checks if the authentication is available and the user is not already authenticated.
    /// If these conditions are met, it attempts to evaluate the device owner authentication policy.
    /// If the authentication is successful, it sets the `isAuthenticated` property to true.
    /// If an error occurs during the authentication process, it calls the `onError` closure with the error.
    func authenticate(onSuccess: @escaping () -> Void = {}) async {
        guard isAvailable, !isAuthenticated else { return }
        do {
            if try await context.evaluatePolicy(.deviceOwnerAuthentication,
                                                localizedReason: "Please authenticate to continue.") {
                isAuthenticated = true
                onSuccess()
            }
        } catch {
            onError(error)
        }
    }
}
