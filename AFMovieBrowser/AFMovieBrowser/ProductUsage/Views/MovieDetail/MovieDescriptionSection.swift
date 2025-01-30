//
//  MovieDescriptionSection.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieDescriptionSection: View {
    let movie: Movie

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Text("Description")
                    .font(Constants.titleFont)
                    .foregroundColor(Constants.titleColor)
                Text(movie.plot ?? "No description available.")
                    .font(Constants.descriptionFont)
                    .foregroundColor(Constants.descriptionColor)
                    .lineSpacing(Constants.lineSpacing)
            }
            Spacer()
        }
    }
}

extension MovieDescriptionSection {
    private enum Constants {
        static let titleFont: Font = .appFont(.mulishBold, size: 16)
        static let descriptionFont: Font = .appFont(.mulishLight, size: 12)
        static let titleColor: Color = .blackCustom
        static let descriptionColor: Color = .greyCustom
        static let spacing: CGFloat = 8
        static let lineSpacing: CGFloat = 6
    }
}
