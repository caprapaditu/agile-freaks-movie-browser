//
//  SideMenuNavigationStore.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import Foundation
import Observation
import SwiftUI

@Observable
class SideMenuNavigationStore {

    var destination: MenuDestination = .home
}

extension SideMenuNavigationStore {

    enum MenuDestination: Int {
        case home
    }
}

extension EnvironmentValues {

    var sideMenuNavigationStore: SideMenuNavigationStore {
        get { self[SideMenuNavigationStoreKey.self] }
        set { self[SideMenuNavigationStoreKey.self] = newValue }
    }
}

struct SideMenuNavigationStoreKey: EnvironmentKey {

    static let defaultValue: SideMenuNavigationStore = SideMenuNavigationStore()
}
