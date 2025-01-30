//
//  NavigationStore.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

class NavigationStore: ObservableObject {

    @Published public var navigationPath: [any Node] = []
    @Published public var rootNode: any Node
    @Published public var childSheetNavigationStore: NavigationStore?

    var bindablePath: [AnyHashable] {
        get {
            navigationPath.map { AnyHashable($0) }
        }

        set {
            navigationPath = newValue.compactMap { $0 as? any Node }
        }
    }

    public weak var parentNavigationStore: NavigationStore?

    init(
        rootNode: any Node,
        parentNavigationStore: NavigationStore?
    ) {
        self.rootNode = rootNode
        self.parentNavigationStore = parentNavigationStore
    }

    public func openSheet(with sheetRoot: any Node) {
        childSheetNavigationStore = NavigationStore(
            rootNode: sheetRoot,
            parentNavigationStore: self
        )
    }

    public func closeSheet() {
        parentNavigationStore?.childSheetNavigationStore = nil
    }
}

extension NavigationStore {

    func popToNode(node: any Node) {
        childSheetNavigationStore = nil
        if navigationPath.contains(where: { $0.id == node.id }) {
            while navigationPath.count > 0, navigationPath.last?.id != node.id {
                navigationPath = navigationPath.dropLast()
            }
            return
        }
        if rootNode.id == node.id {
            navigationPath = []
            return
        }

        closeSheet()
        parentNavigationStore?.popToNode(node: node)
    }
}
