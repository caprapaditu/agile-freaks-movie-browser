//
//  NowShowingMovieListView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct NowShowingMovieListView: View {
    @Binding var movies: [Movie]
    @Binding var selectedMovie: Movie?

    var body: some View {
        MovieListRowView(
            movies: movies,
            headerTitle: Constants.nowShowingHeader,
            showSeeMoreButton: true,
            isHorizontal: true,
            selectedMovie: $selectedMovie
        )
    }
}

extension NowShowingMovieListView {
    private enum Constants {
        static let nowShowingHeader = "Now Showing"
    }
}
