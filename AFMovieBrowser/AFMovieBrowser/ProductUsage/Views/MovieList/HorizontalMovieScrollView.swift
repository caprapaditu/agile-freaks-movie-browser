//
//  HorizontalMovieScrollView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct HorizontalMovieScrollView: View {
    let movies: [Movie]
    @Binding var selectedMovie: Movie?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: Constants.horizontalScrollViewSpacing) {
                ForEach(movies) { movie in
                    MovieRow(movie: movie, useVerticalStyle: true)
                        .frame(width: Constants.movieRowWidth)
                        .onTapGesture {
                            selectedMovie = movie
                        }
                }
            }
            .padding(.horizontal, Constants.horizontalPadding)
        }
    }
}

extension HorizontalMovieScrollView {
    private enum Constants {
        static let horizontalScrollViewSpacing: CGFloat = 16
        static let movieRowWidth: CGFloat = 150
        static let horizontalPadding: CGFloat = 16
    }
}
