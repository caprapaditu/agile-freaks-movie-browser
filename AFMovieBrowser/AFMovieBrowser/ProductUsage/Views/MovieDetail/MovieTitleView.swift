//
//  MovieTitleView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieTitleView: View {
    let movie: Movie
    let bookmarkAction: () -> ()

    var body: some View {
        HStack {
            Text(movie.title)
                .font(.appFont(.mulishBold, size: Constants.fontSize))
            Spacer()
            Button(action: {
                bookmarkAction()
            }) {
                Image(systemName: "bookmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.bookmarkImageSize, height: Constants.bookmarkImageSize)
                    .foregroundColor(.black)
            }
        }
    }
}

extension MovieTitleView {
    private enum Constants {
        static let fontSize = 20.0
        static let bookmarkImageSize = 24.0
    }
}
