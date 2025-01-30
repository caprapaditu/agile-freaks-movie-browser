//
//  MovieTrailerView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieTrailerView: View {
    let movie: Movie
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .center) {
            AsyncImage(url: URL(string: movie.posters?.first?.url ?? "")) { phase in
                if let image = phase.image {
                    image.resizable().aspectRatio(contentMode: .fill)
                } else if phase.error != nil {
                    Color.red // Error state
                } else {
                    ProgressView() // Loading state
                }
            }
            .scaledToFill()
            .frame(height: Constants.imageHeight)
            .clipped()

            // Play button in the center
            Button(action: {
                print("Play Trailer")
            }) {
                VStack(spacing: 8) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .frame(width: Constants.buttonSize, height: Constants.buttonSize)
                        .foregroundColor(.whiteCustom)
                    Text("Play trailer")
                        .font(.appFont(.mulishRegular, size: 12))
                        .foregroundStyle(.whiteCustom)
                }
            }
        }
        .overlay(
            HStack {
                // Back button
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.iconSize, height: Constants.iconSize)
                        .foregroundColor(.white)
                        .padding()
                }
                Spacer()

                // Three dots menu button
                Button(action: {
                    print("More options")
                }) {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Constants.iconSize, height: Constants.iconSize / 4)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .frame(height: 60)
            .padding()
            .padding(.top, 40)
            , alignment: .top
        )
    }
}

extension MovieTrailerView {
    private enum Constants {
        static let imageHeight: CGFloat = 300
        static let buttonSize: CGFloat = 50
        static let iconSize: CGFloat = 24
    }
}
