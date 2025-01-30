//
//  MovieListRowView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 28.01.2025.
//

import SwiftUI

struct MovieListRowView: View {
    let movies: [Movie]
    let headerTitle: String
    let showSeeMoreButton: Bool
    let isHorizontal: Bool
    @Binding var selectedMovie: Movie? // Binding to update parent

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.vStackSpacing) {
            MovieListHeader(title: headerTitle, showSeeMoreButton: showSeeMoreButton)
            if isHorizontal {
                HorizontalMovieScrollView(movies: movies, selectedMovie: $selectedMovie)
            } else {
                VerticalMovieListView(movies: movies, selectedMovie: $selectedMovie)
            }
        }
    }
}

extension MovieListRowView {
    private enum Constants {
        static let vStackSpacing: CGFloat = 16
        static let horizontalPadding: CGFloat = 16
    }
}
