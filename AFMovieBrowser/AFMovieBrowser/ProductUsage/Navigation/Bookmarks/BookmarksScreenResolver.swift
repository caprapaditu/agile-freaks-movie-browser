//
//  BookmarksScreenResolver.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//

import SwiftUI

struct BookmarksScreenResolver: ViewResolver {

    func resolveView(node: BookmarksScreenNode) -> some View {
        FavoriteScreenView()
    }
}
