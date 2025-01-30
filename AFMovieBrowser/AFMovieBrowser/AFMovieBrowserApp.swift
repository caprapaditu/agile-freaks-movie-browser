//
//  AFMovieBrowserApp.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import SwiftUI

@main
struct AFMovieBrowserApp: App {

    @State private var appRootStore = AppRootStore()

    var body: some Scene {
        WindowGroup {
            switch appRootStore.current {
            case .appLaunch:
                LaunchView()
                    .environment(\.appRootStore, appRootStore)
            case .home:
                ProductUsageView()
                    .environment(\.appRootStore, appRootStore)
            }
        }
    }
}
