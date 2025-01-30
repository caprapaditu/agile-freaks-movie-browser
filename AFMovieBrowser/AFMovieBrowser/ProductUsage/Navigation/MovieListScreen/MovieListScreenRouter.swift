//
//  MovieListScreenRouter.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

protocol MovieListScreenRouter: AnyObject {

    func navigate(_ route: MovieListScreenRoute)
}

enum MovieListScreenRoute: Hashable {
    
    case movieDetail(movie: Movie)
}

class DefaultMovieListScreenRouter: MovieListScreenRouter {

    func navigate(_ route: MovieListScreenRoute) {
        assertionFailure()
    }
}

extension EnvironmentValues {

    var movieListScreenRouter: MovieListScreenRouter {
        get { self[MovieListScreenRouterKey.self] }
        set { self[MovieListScreenRouterKey.self] = newValue }
    }
}

struct MovieListScreenRouterKey: EnvironmentKey {

    static let defaultValue: MovieListScreenRouter = DefaultMovieListScreenRouter()
}

extension NavigationStore: MovieListScreenRouter {

    func navigate(_ route: MovieListScreenRoute) {
        switch route {
        case .movieDetail(let movie):
            navigationPath.append(MovieDetailNode(movie: movie))
        }
    }
}

