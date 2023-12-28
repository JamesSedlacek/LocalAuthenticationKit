//
//  LocalAuthenticationView.swift
//
//  Created by James Sedlacek on 12/27/23.
//

import SwiftUI

struct LocalAuthenticationView: View {
    @Environment(\.localAuthService)
    private var localAuthService

    var body: some View {
        VStack(spacing: 16) {
            Image(symbol: .lock)
                .font(.system(size: 40, weight: .medium))
                .foregroundStyle(.primary)
                .padding(20)
                .background {
                    Circle()
                        .fill(.secondary.opacity(0.4))
                }

            Button("Unlock") {
                Task {
                    await localAuthService.authenticate()
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
