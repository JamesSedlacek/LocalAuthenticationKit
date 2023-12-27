//
//  LocalAuthViewModifier.swift
//
//  Created by James Sedlacek on 12/26/23.
//

import SwiftUI

struct LocalAuthViewModifier: ViewModifier {
    @State private var localAuthProvider: LocalAuthProvider
    @State private var localAuthService: any LocalAuthServiceable

    private var isAuthScreenPresented: Bool {
        localAuthProvider.isEnabled && !localAuthService.isAuthenticated
    }

    init(storage: UserDefaults = .standard,
         onError: @escaping (Error) -> Void = {_ in }) {
        _localAuthProvider = .init(initialValue: LocalAuthProvider(storage: storage))
        _localAuthService = .init(initialValue: LocalAuthService(onError: onError))
    }

    func body(content: Content) -> some View {
        Group {
            if isAuthScreenPresented {
                LocalAuthenticationView()
            } else {
                content
            }
        }
        .environment(localAuthProvider)
        .environment(\.localAuthService, localAuthService)
    }
}
