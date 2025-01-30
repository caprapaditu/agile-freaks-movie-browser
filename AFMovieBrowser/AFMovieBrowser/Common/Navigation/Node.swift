//
//  Node.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import Foundation

protocol Node: Hashable {

    var id: String { get }
}

extension Node {

    var id: String {
        String(describing: type(of: self))
    }
}
