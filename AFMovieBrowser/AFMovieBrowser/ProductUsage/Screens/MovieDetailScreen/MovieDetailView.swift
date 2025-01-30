//
//  DetailView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var viewModel = ViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.standardSpacing) {
                ZStack(alignment: .top) {
                    MovieTrailerView(movie: movie)
                        .edgesIgnoringSafeArea(.top) // Make sure it goes to the top of the screen
                        .frame(height: Constants.trailerHeight) // Control height of the trailer view
                        .zIndex(0)

                    VStack {
                        VStack(spacing: Constants.standardSpacing) {
                            VStack(spacing: Constants.titleRatingSpacing) {
                                MovieTitleView(movie: movie) {
                                    print("Bookmark tapped")
                                }
                                MovieRatingView(movie: movie)
                            }
                            MovieGenresView(movie: movie, customAmountOfGenres: .max)
                            MovieInfoSection(movie: movie)
                            MovieDescriptionSection(movie: movie)
                            MovieCastSection(movie: movie)
                        }
                        .padding(Constants.standardPadding)
                    }
                    .background(.whiteCustom)
                    .padding(.top, Constants.topInfoContainerPadding)
                    .zIndex(1)
                }
            }
        }.toolbar(.hidden)
        .edgesIgnoringSafeArea(.top)
    }
}

extension MovieDetailView {
    private enum Constants {
        static let standardPadding = 24.0
        static let standardSpacing = 16.0
        static let titleRatingSpacing = 8.0
        static let trailerHeight = 300.0
        static let topInfoContainerPadding = 240.0
        static let topInfoContainerCornerRadius = 10.0
    }
}
