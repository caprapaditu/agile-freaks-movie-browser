//
//  TabMenuRouter.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import SwiftUI

public protocol TabRouter: AnyObject {

    func navigate(_ route: TabRoute)
}

public enum TabRoute: Hashable {

    case home
    case tickets
    case favorite
}


class DefaultTabRouter: TabRouter {

    func navigate(_ route: TabRoute) {
        assertionFailure("Navigation not implemented")
    }
}

public extension EnvironmentValues {

    var tabRouter: TabRouter {
        get { self[TabRouterKey.self] }
        set { self[TabRouterKey.self] = newValue }
    }
}

struct TabRouterKey: EnvironmentKey {

    static let defaultValue: TabRouter = DefaultTabRouter()
}

extension NavigationStore: TabRouter {

    public func navigate(_ route: TabRoute) {
        switch route {
        case .home:
            navigationPath.append(MovieListNode())
        case .tickets:
            navigationPath.append(TicketsScreenNode())
        case .favorite:
            navigationPath.append(BookmarksScreenNode())
        }
    }
}
