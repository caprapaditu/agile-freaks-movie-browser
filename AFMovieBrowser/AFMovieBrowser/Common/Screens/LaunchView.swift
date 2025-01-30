//
//  LaunchView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import SwiftUI

struct LaunchView: View {

    @Environment(\.appRootStore) private var appRootStore: AppRootStore

    @State private var viewModel = ViewModel()

    var body: some View {
        ZStack {
            MainBackgroundView()
            .onAppear {
                // Extra added in case we want to load data or perform LaunchView animation
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    appRootStore.current = .home
                }
            }
        }
    }
}
