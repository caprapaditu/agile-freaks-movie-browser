//
//  MovieDetailResolver.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import SwiftUI

struct MovieDetailResolver: ViewResolver {

    func resolveView(node: MovieDetailNode) -> some View {
        MovieDetailView(movie: node.movie)
    }
}
