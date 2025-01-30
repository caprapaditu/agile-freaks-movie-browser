//
//  SeeMoreButtonView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 30.01.2025.
//


import SwiftUI

struct SeeMoreButtonView: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("See More")
                .font(Constants.seeMoreFont)
                .padding(.horizontal, Constants.seeMorePaddingHorizontal)
                .padding(.vertical, Constants.seeMorePaddingVertical)
                .foregroundColor(Constants.seeMoreTextColor)
                .cornerRadius(Constants.seeMoreCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.seeMoreCornerRadius)
                        .stroke(Constants.seeMoreBorderColor, lineWidth: Constants.seeMoreBorderWidth)
                )
        }
    }
}

extension SeeMoreButtonView {
    private enum Constants {
        static let seeMoreFont: Font = .appFont(.mulishLight, size: 10)
        static let seeMorePaddingHorizontal: CGFloat = 8
        static let seeMorePaddingVertical: CGFloat = 4
        static let seeMoreCornerRadius: CGFloat = 20
        static let seeMoreBorderWidth: CGFloat = 1
        static let seeMoreTextColor: Color = .greyLight
        static let seeMoreBorderColor: Color = .greyLight
    }
}
