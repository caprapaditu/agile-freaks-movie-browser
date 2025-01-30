//
//  HomeScreenView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

struct HomeScreenView: View {

    @State private var viewModel = ViewModel()

    @Environment(\.tabRouter)
    private var tabRouter: TabRouter

    var body: some View {
            TabView {
                // Home Tab
                MovieListScreenView()
                    .tabItem {
                        Label("", image: ImageResource.movielistIcon)
                    }
                    .tag(0)
                    .onTapGesture {
                        tabRouter.navigate(.home)
                    }

                // Search Tab
                TicketsScreenView()
                    .tabItem {
                        Label("", image: ImageResource.ticketsIcon)
                    }
                    .tag(1)
                    .onTapGesture {
                        tabRouter.navigate(.tickets)
                    }

                // Profile Tab
                FavoriteScreenView()
                    .tabItem {
                        Label("", image: ImageResource.bookmarkIcon)
                    }
                    .tag(2)
                    .onTapGesture {
                        tabRouter.navigate(.favorite)
                    }
            }
    }
}
