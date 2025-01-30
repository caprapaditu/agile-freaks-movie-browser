//
//  ViewResolver.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

protocol ViewResolver {

    associatedtype V: View
    associatedtype N: Node

    func resolveView(node: N) -> V
}
