//
//  ViewFactory.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

extension ProductUsageView {

    @MainActor
    struct ViewFactory {
        @ViewBuilder
        func getView(for node: any Node) -> some View {
            switch node {
            case let node as HomeScreenNode:
                HomeScreenResolver().resolveView(node: node)
            case let node as MovieDetailNode:
                MovieDetailResolver().resolveView(node: node)
            case let node as MovieListNode:
                MovieListResolver().resolveView(node: node)
            case let node as TicketsScreenNode:
                TicketsScreenResolver().resolveView(node: node)
            case let node as BookmarksScreenNode:
                BookmarksScreenResolver().resolveView(node: node)
            default:
                let labelText = "Error: No Destination"
                Text(labelText)
            }
        }

        @ViewBuilder
        func getView(for node: AnyHashable) -> some View {
            if let node = node as? any Node {
                getView(for: node)
            } else {
                let labelText = "Error: Not conforming to node"
                Text(labelText)
            }
        }
    }
}

extension View {

    func shareProductUsageStore(navigationStore: NavigationStore) -> some View {
        self.environment(\.movieListScreenRouter, navigationStore)
            .environment(\.homeScreenRouter, navigationStore)
            .environment(\.tabRouter, navigationStore)
            .environment(\.movieDetailRouter, navigationStore)
    }
}
