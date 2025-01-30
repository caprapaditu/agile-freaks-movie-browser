//
//  MovieCastSection.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieCastSection: View {
    let movie: Movie

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.sectionSpacing) {
            // Header with Title & "See More" Button
            HStack {
                Text("Cast")
                    .font(Constants.castTitleFont)
                    .foregroundColor(.blackCustom)

                Spacer()

                SeeMoreButtonView(action: {
                    print("See More tapped")
                })
            }

            if let casts = movie.casts {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: Constants.castSpacing) {
                        ForEach(casts.prefix(4), id: \.name?.id) { actor in
                            VStack(alignment: .leading) {
                                AsyncImage(url: URL(string: actor.name?.avatars?.first?.url ?? "")) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } else if phase.error != nil {
                                        Color.red // Error state
                                    } else {
                                        ProgressView() // Loading state
                                    }
                                }
                                .frame(width: Constants.imageWidth, height: Constants.imageHeight)
                                .clipShape(RoundedRectangle(cornerRadius: Constants.imageCornerRadius))
                                .overlay(RoundedRectangle(cornerRadius: Constants.imageCornerRadius)
                                    .stroke(Color.gray, lineWidth: Constants.imageBorderWidth))

                                Text(actor.name?.display_name ?? "")
                                    .font(Constants.actorFont)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: Constants.imageWidth)
                                    .lineLimit(2)
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

// MARK: - Constants
extension MovieCastSection {
    private enum Constants {
        static let sectionSpacing: CGFloat = 8
        static let castSpacing: CGFloat = 16
        static let imageWidth: CGFloat = 72
        static let imageHeight: CGFloat = 72
        static let imageCornerRadius: CGFloat = 12
        static let imageBorderWidth: CGFloat = 0
        static let horizontalPadding: CGFloat = 16

        static let castTitleFont: Font = .appFont(.mulishBold, size: 16)
        static let actorFont: Font = .appFont(.mulishRegular, size: 12)
    }
}
