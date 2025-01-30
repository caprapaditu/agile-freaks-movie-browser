//
//  HomeScreenRouter.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//


import SwiftUI

protocol HomeScreenRouter: AnyObject {

    func navigate(_ route: HomeScreenRoute)
}

enum HomeScreenRoute: Hashable {
}

class DefaultHomeScreenRouter: HomeScreenRouter {

    func navigate(_ route: HomeScreenRoute) {
        assertionFailure()
    }
}

extension EnvironmentValues {

    var homeScreenRouter: HomeScreenRouter {
        get { self[HomeScreenRouterKey.self] }
        set { self[HomeScreenRouterKey.self] = newValue }
    }
}

struct HomeScreenRouterKey: EnvironmentKey {

    static let defaultValue: HomeScreenRouter = DefaultHomeScreenRouter()
}

extension NavigationStore: HomeScreenRouter {

    func navigate(_ route: HomeScreenRoute) {
        //
    }
}
