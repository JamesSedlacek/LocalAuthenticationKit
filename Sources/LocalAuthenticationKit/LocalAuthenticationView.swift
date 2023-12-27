//
//  LocalAuthenticationView.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

struct LocalAuthenticationView: View {
    @Environment(\.localAuthService)
    private var localAuthService

    private var displayImage: Image {
        Image(symbol: localAuthService.isAuthenticated ? .lockOpen : .lock)
    }

    var body: some View {
        VStack(spacing: 16) {
            displayImage
                .contentTransition(.symbolEffect(.replace))
                .font(.system(size: 40, weight: .medium))
                .foregroundStyle(.primary)
                .padding(20)
                .background {
                    Circle()
                        .fill(.secondary.opacity(0.4))
                }
            if localAuthService.isAuthenticated {
                Text("Unlocked")
            } else {
                Button("Tap to unlock") {
                    Task {
                        await localAuthService.authenticate()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            await localAuthService.authenticate()
        }
    }
}

#Preview {
    LocalAuthenticationView()
        .environment(\.localAuthService, MockLocalAuthService())
}
