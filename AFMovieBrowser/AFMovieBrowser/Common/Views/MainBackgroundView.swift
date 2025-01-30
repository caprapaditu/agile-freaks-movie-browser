//
//  MainBackgroundView.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 27.01.2025.
//


import SwiftUI

struct MainBackgroundView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
            VStack(spacing: Constants.standardSpacing) {
                Text("Agile Freaks Movie Browser")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.black)
                Image(ImageResource.agileFreaksLogo)
                    .padding()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .ignoresSafeArea()
    }
}

extension MainBackgroundView {
    private enum Constants {
        static let standardSpacing = 16.0
    }
}
