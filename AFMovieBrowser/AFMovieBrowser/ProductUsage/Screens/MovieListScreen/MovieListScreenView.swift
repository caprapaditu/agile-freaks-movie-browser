//
//  MovieListScreenView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//

import SwiftUI

struct MovieListScreenView: View {

    @Environment(\.movieListScreenRouter) private var router: MovieListScreenRouter
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        VStack {
            customNavigationBar()
            contentView
                .padding(.top, Constants.standardPadding)
            Spacer()
        }
        .onAppear { viewModel.fetchMovies() }
        .onChange(of: viewModel.selectedMovie, { oldValue, newValue in
            if let selectedMovie = viewModel.selectedMovie {
                router.navigate(.movieDetail(movie: selectedMovie))
            }
        })
    }

    private var contentView: some View {
        VStack(spacing: Constants.standardSpacing) {
            NowShowingMovieListView(movies: $viewModel.nowShowingMovies, selectedMovie: $viewModel.selectedMovie)
            PopularMovieListView(movies: $viewModel.popularMovies, selectedMovie: $viewModel.selectedMovie)
        }
    }

    private func customNavigationBar() -> some View {
        CustomNavigationBar(title: "FilmKu",
                            hasNewNotifications: $viewModel.hasNewNotifications,
                            onMenuButtonTapped: handleMenuButtonTap,
                            onNotificationButtonTapped: handleNotificationButtonTap)
            .padding(.top, Constants.topNavigationBarPadding)
    }

    private func handleNotificationButtonTap() {
        print("Notification button tapped")
    }

    private func handleMenuButtonTap() {
        print("Menu button tapped")
    }
}


extension MovieListScreenView {
    private enum Constants {
        static let topNavigationBarPadding: CGFloat = 15.0
        static let standardPadding: CGFloat = 8.0
        static let standardSpacing: CGFloat = 24.0
    }
}

#Preview {
    MovieListScreenView()
}
