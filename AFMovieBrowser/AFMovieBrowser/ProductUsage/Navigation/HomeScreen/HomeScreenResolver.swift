//
//  HomeScreenResolver.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

struct HomeScreenResolver: ViewResolver {

    func resolveView(node: HomeScreenNode) -> some View {
        HomeScreenView()
    }
}
