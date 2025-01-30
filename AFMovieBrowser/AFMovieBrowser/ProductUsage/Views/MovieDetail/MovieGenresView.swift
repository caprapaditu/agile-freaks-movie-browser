//
//  MovieGenresView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieGenresView: View {
    let movie: Movie
    let customAmountOfGenres: Int?

    var body: some View {
        HStack {
            ForEach(movie.genres?.prefix(customAmountOfGenres ?? .max) ?? [], id: \.self) { genre in
                Text(genre)
                    .textCase(.uppercase)
                    .lineLimit(1)
                    .font(Constants.font)
                    .padding(.horizontal, Constants.paddingHorizontal)
                    .padding(.vertical, Constants.paddingVertical)
                    .background(Constants.backgroundColor)
                    .foregroundColor(Constants.textColor)
                    .cornerRadius(Constants.cornerRadius)
            }
            Spacer()
        }
    }
}

extension MovieGenresView {
    private enum Constants {
        static let font: Font = .appFont(.mulishRegular, size: 8)
        static let paddingHorizontal: CGFloat = 12
        static let paddingVertical: CGFloat = 4
        static let backgroundColor: Color = Color.blueCustom.opacity(0.2)
        static let textColor: Color = Color.blueCustom
        static let cornerRadius: CGFloat = 10
    }
}
