//
//  PopularMovieListView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct PopularMovieListView: View {
    @Binding var movies: [Movie]
    @Binding var selectedMovie: Movie?

    var body: some View {
        MovieListRowView(
            movies: movies,
            headerTitle: Constants.popularHeader,
            showSeeMoreButton: true,
            isHorizontal: false,
            selectedMovie: $selectedMovie
        )
    }
}

extension PopularMovieListView {
    private enum Constants {
        static let popularHeader = "Popular"
    }
}
