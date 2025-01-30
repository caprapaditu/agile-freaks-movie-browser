//
//  MovieDetailRouter.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import SwiftUI

protocol MovieDetailRouter: AnyObject {

    func navigate(_ route: MovieDetailRoute)
}

enum MovieDetailRoute: Hashable {
    case back
}

class DefaultMovieDetailRouter: MovieDetailRouter {

    func navigate(_ route: MovieDetailRoute) {
        assertionFailure()
    }
}

extension EnvironmentValues {

    var movieDetailRouter: MovieDetailRouter {
        get { self[MovieDetailRouterKey.self] }
        set { self[MovieDetailRouterKey.self] = newValue }
    }
}

struct MovieDetailRouterKey: EnvironmentKey {

    static let defaultValue: MovieDetailRouter = DefaultMovieDetailRouter()
}

extension NavigationStore: MovieDetailRouter {

    func navigate(_ route: MovieDetailRoute) {
        switch route {
        case .back:
            navigationPath.removeLast()
        }
    }
}
