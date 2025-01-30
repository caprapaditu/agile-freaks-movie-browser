//
//  Movie.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 28.01.2025.
//

import Foundation
import AFAgileFreaksAPI

struct Movie: Identifiable, Hashable {
    let id: String
    let title: String
    let type: String
    let posters: [AFAgileFreaksAPI.MovieDetailsQuery.Data.Title.Poster]?
    let rating: AFAgileFreaksAPI.MovieDetailsQuery.Data.Title.Rating?
    let genres: [String]?
    let runtimeMinutes: Int?
    let isAdult: Bool
    let spokenLanguages: [AFAgileFreaksAPI.MovieDetailsQuery.Data.Title.Spoken_language]?
    let plot: String?
    let casts: [AFAgileFreaksAPI.MovieDetailsQuery.Data.Title.Cast]?

    init(from title: AFAgileFreaksAPI.MovieDetailsQuery.Data.Title) {
        self.id = title.id
        self.title = title.primary_title
        self.type = title.type
        self.posters = title.posters
        self.rating = title.rating
        self.genres = title.genres
        self.runtimeMinutes = title.runtime_minutes
        self.isAdult = title.is_adult
        self.spokenLanguages = title.spoken_languages
        self.plot = title.plot
        self.casts = title.casts
    }
}
