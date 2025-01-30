//
//  TicketsScreenResolver.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//


import SwiftUI

struct TicketsScreenResolver: ViewResolver {

    func resolveView(node: TicketsScreenNode) -> some View {
        TicketsScreenView()
    }
}
