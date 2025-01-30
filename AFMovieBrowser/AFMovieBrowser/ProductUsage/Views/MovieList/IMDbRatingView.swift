//
//  IMDbRatingView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import SwiftUI

struct IMDbRatingView: View {
    let movie: Movie

    var body: some View {
        // Rating
        HStack(spacing: Constants.ratingSpacing) {
            Image(systemName: "star.fill")
                .resizable()
                .foregroundColor(.yellow)
                .frame(width: Constants.ratingIconSize, height: Constants.ratingIconSize)
            Text(String(format: "%.1f/10 IMDb", movie.rating?.aggregate_rating ?? 0.0))
                .font(Constants.ratingFont)
                .foregroundStyle(Constants.ratingTextColor)
        }
    }
}

extension IMDbRatingView {
    private enum Constants {
        static let ratingSpacing: CGFloat = 4
        static let ratingFont: Font = .appFont(.mulishLight, size: 12)
        static let ratingIconSize: CGFloat = 12
        static let ratingTextColor: Color = .greyLight
    }
}
