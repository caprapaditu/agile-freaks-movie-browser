//
//  AppRootStore.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import Observation
import SwiftUI

@Observable
class AppRootStore {

    var current: RootType = .appLaunch

    init() {
        ThemeService.shared.start()
    }
}

extension AppRootStore {

    enum RootType: Int {
        case appLaunch
        case home
    }
}

extension EnvironmentValues {
    var appRootStore: AppRootStore {
        get { self[AppRootStoreKey.self] }
        set { self[AppRootStoreKey.self] = newValue }
    }
}

struct AppRootStoreKey: EnvironmentKey {
    static let defaultValue: AppRootStore = AppRootStore()
}
