//
//  LocalAuthToggle.swift
//  
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

public struct LocalAuthToggle: View {
    @Environment(LocalAuthProvider.self)
    private var localAuthProvider
    @Environment(\.localAuthService)
    private var localAuthService

    public init() { }

    public var body: some View {
        let isAuthEnabled = Binding<Bool>(
            get: { self.localAuthProvider.isEnabled },
            set: { newValue in
                if newValue {
                    Task {
                        await localAuthService.authenticate {
                            localAuthProvider.isEnabled = true
                        }
                    }
                } else {
                    localAuthProvider.isEnabled = false
                }
            }
        )
        
        Toggle(isOn: isAuthEnabled) { }
    }
}

#Preview {
    // NOTE - in your app you'll want to use `@Environment` to access the `LocalAuthService`
    @State var localAuthService = MockLocalAuthService()
    @State var localAuthProvider = LocalAuthProvider()

    return NavigationStack {
        List {
            HStack(spacing: 12) {
                localAuthService.icon
                    .foregroundStyle(.white)
                    .padding(4)
                    .background {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.blue)
                    }
                Text("Privacy Lock")
                Spacer()
                LocalAuthToggle()
            }
        }
        .navigationTitle("Settings")
    }
    // NOTE - in your app you won't need to add `.environment` because there will already be a LocalAuthProvider added to the environment via the `.authenticateIfEnabled()` view function. 
    .environment(localAuthProvider)
    .environment(\.localAuthService, localAuthService)
}
