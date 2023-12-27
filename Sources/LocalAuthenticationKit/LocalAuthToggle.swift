//
//  LocalAuthToggle.swift
//  
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

struct LocalAuthToggle: View {
    @Environment(LocalAuthProvider.self)
    private var localAuthProvider

    var body: some View {
        @Bindable var localAuthProvider = localAuthProvider
        Toggle(isOn: $localAuthProvider.isEnabled) { }
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
                LocalAuthToggle()
            }
        }
        .navigationTitle("Settings")
    }
    // NOTE - in your app you won't need to add `.environment` because there will already be a LocalAuthProvider added to the environment via the `.authenticateIfEnabled()` view function. 
    .environment(localAuthProvider)
}
