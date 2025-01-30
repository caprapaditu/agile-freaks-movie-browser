//
//  MovieRatingView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieRatingView: View {
    let movie: Movie

    var body: some View {
        HStack {
            IMDbRatingView(movie: movie)
            Spacer()
        }
    }
}
