//
//  ContentView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import SwiftUI

struct ProductUsageView: View {

    @State private var viewModel = ViewModel()
    @StateObject private var navigationStore = NavigationStore(
        rootNode: HomeScreenNode(),
        parentNavigationStore: nil
    )

    var body: some View {
        NavigationStack(path: $navigationStore.bindablePath) {
            ViewFactory().getView(for: navigationStore.rootNode)
                .navigationDestination(for: AnyHashable.self) { destination in
                    ViewFactory().getView(for: destination)
                }
        }
        .shareProductUsageStore(navigationStore: navigationStore)
    }
}
