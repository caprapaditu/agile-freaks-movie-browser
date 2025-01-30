//
//  MovieListHeader.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieListHeader: View {
    let title: String
    let showSeeMoreButton: Bool

    var body: some View {
        HStack {
            Text(title)
                .font(Constants.headerFont)
                .fontWeight(Constants.headerFontWeight)
            Spacer()
            if showSeeMoreButton {
                SeeMoreButtonView(action: {
                    print("See More tapped")
                })
            }
        }
        .padding(.horizontal, Constants.horizontalPadding)
    }
}

extension MovieListHeader {
    private enum Constants {
        static let headerFont: Font = .appFont(.merriweatherBold, size: 16)
        static let headerFontWeight: Font.Weight = .bold
        static let horizontalPadding: CGFloat = 16
    }
}
