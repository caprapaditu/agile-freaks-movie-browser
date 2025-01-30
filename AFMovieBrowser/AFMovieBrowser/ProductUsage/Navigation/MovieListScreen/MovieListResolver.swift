//
//  MovieListResolver.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import SwiftUI

struct MovieListResolver: ViewResolver {

    func resolveView(node: MovieListNode) -> some View {
        MovieListScreenView()
    }
}
