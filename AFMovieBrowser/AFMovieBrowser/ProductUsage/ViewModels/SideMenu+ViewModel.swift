//
//  MenuItems.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import Observation
import SwiftUI

enum MenuItems: Hashable {
    case home

    var title: LocalizedStringKey {
        switch self {
        case .home:
            return "Home"
        }
    }

    var image: Image {
        switch self {
        case .home:
            Image(systemName: "house.fill")
        }
    }

    var navigationDestination: SideMenuNavigationStore.MenuDestination {
        switch self {
        case .home: .home
        }
    }
}

extension SideMenuView {

    @Observable
    class ViewModel {
        func menuItems() -> [MenuItems] {
            [.home]
        }
    }
}
