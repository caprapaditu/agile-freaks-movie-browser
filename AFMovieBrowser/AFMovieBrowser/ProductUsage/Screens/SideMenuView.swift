//
//  SideMenuView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

// TODO: NOT USED BECAUSE LACK OF DESIGN

struct SideMenuView: View {

    @Environment(\.sideMenuNavigationStore) private var sideMenuNavigationStore: SideMenuNavigationStore

    @State private var viewModel = ViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            List {
                Section {
                    ForEach(
                        viewModel.menuItems(),
                        id: \.self
                    ) { menuItem in
                        getButton(menuItem)
                            .padding(.all, -Constants.buttonPadding)
                    }
                }
                .listRowBackground(Color.clear)
            }
            .background(.clear)
            .scrollContentBackground(.hidden)
            .frame(maxWidth: Constants.maxFrameMenu)

            Spacer()
        }.background(
            Color.whiteCustom
        )
    }

    func getButton(_ menuItem: MenuItems) -> some View {
        let isSelected = menuItem.navigationDestination == sideMenuNavigationStore.destination
        let selectionChanged = sideMenuNavigationStore.destination != menuItem.navigationDestination

        return Button(
            action: {
                if selectionChanged {
                    sideMenuNavigationStore.destination = menuItem
                        .navigationDestination
                }
            },
            label: {
                MenuItemView(
                    image: menuItem.image,
                    title: menuItem.title,
                    isSelected: isSelected
                )
            }
        )
    }
}

extension SideMenuView {
    private enum Constants {
        static let buttonPadding = -10.0
        static let maxFrameMenu = 200.0
    }
}
