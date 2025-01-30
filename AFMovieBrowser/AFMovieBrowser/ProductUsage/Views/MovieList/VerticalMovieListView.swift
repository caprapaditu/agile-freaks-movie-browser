//
//  VerticalMovieListView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct VerticalMovieListView: View {
    let movies: [Movie]
    @Binding var selectedMovie: Movie?

    var body: some View {
        List(movies) { movie in
            Button(action: {
                selectedMovie = movie
            }) {
                MovieRow(movie: movie, useVerticalStyle: false)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .buttonStyle(PlainButtonStyle())
        }
        .listStyle(.plain)
    }
}
