//
//  MenuItemView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

struct MenuItemView: View {
    var image: Image
    var title: LocalizedStringKey
    var isSelected: Bool

    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .topTrailing) {
                image
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(isSelected ? .white : Color.greyCustom )
                    .frame(width: Constants.iconSize, height: Constants.iconSize)
                    .padding(.all, Constants.iconPadding)
                    .background {
                        Capsule()
                            .fill(isSelected ? Color.greyCustom : Color.blackCustom)
                            .aspectRatio(1, contentMode: .fill)
                    }
            }
            .padding(.leading, Constants.leadingPadding)
            Text(title)
                .font(Constants.titleFont)
                .padding(.leading, Constants.textPadding)
                .foregroundStyle(isSelected ? .whiteCustom : .greyCustom)
            Spacer()
        }.frame(height: Constants.rowHeight)
        .background(
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .fill(isSelected ? .black.opacity(0.2) : .clear)
        )
        .listRowInsets(EdgeInsets())
    }
}

extension MenuItemView {
    private enum Constants {
        static let iconSize: CGFloat = 20
        static let iconPadding: CGFloat = 8
        static let leadingPadding: CGFloat = 18
        static let textPadding: CGFloat = 16
        static let rowHeight: CGFloat = 66
        static let cornerRadius: CGFloat = 33
        static let titleFont: Font = .subheadline
    }
}
