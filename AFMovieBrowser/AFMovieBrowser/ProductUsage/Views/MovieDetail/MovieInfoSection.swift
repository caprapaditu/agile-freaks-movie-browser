//
//  MovieInfoSection.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import SwiftUI

struct MovieInfoSection: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: Constants.standardSpacing) {
            MovieInfoView(label: "Duration", value: movie.runtimeMinutes?.timeFormattedHoursMinutes ?? "")
            MovieInfoView(label: "Language", value: movie.spokenLanguages?.first?.name ?? "Unknown")
            MovieInfoView(label: "Rating", value: movie.isAdult ? "+18" : "General Audience")
            Spacer()
        }
    }
}

extension MovieInfoSection {
    private enum Constants {
        static let standardSpacing = 20.0
    }
}
