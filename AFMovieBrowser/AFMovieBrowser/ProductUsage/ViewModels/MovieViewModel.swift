//
//  MovieViewModel.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import Combine
import AFAgileFreaksAPI
import Foundation

extension MovieListScreenView {
    class ViewModel: ObservableObject {
        @Published var isLoading = false
        @Published var errorMessage: String?

        @Published var hasNewNotifications: Bool = true

        @Published var selectedMovie: Movie? // Track selected movie

        private var hardcodedNowShowingMoviesIdList = ["tt10872600", "tt9032400", "tt14688458"]
        private var hardcodedPopularMoviesIdList = ["tt16366836", "tt2251281", "tt24069848"]

        @Published var nowShowingMovies: [Movie] = []
        @Published var popularMovies: [Movie] = []

        private let client = ApolloClientManager.shared

        func fetchMovies(for ids: [String]) async -> [Movie] {
            await withTaskGroup(of: Movie?.self) { group in
                var movies: [Movie] = []

                for id in ids {
                    group.addTask {
                        do {
                            let result = try await self.fetchMovie(id: id)
                            return result
                        } catch {
                            print("Error fetching movie \(id): \(error)")
                            return nil
                        }
                    }
                }

                for await movie in group {
                    if let movie = movie {
                        movies.append(movie)
                    }
                }

                return movies
            }
        }

        private func fetchMovie(id: String) async throws -> Movie {
            try await withCheckedThrowingContinuation { continuation in
                let query = MovieDetailsQuery(id: id)

                client.fetch(query: query) { result in
                    switch result {
                        case .success(let data):
                            if let title = data?.title {
                                let movie = Movie(from: title)
                                continuation.resume(returning: movie)
                            } else {
                                continuation.resume(throwing: ApolloError.networkError(NSError(domain: "No Data", code: -1, userInfo: nil)))
                            }
                        case .failure(let error):
                            continuation.resume(throwing: error)
                    }
                }
            }
        }

        @MainActor
        func loadMovies() async {
            async let nowShowing = fetchMovies(for: hardcodedNowShowingMoviesIdList)
            async let popular = fetchMovies(for: hardcodedPopularMoviesIdList)

            // Ensure updates happen on the main thread
            nowShowingMovies = await nowShowing
            popularMovies = await popular
        }

        @MainActor
        func fetchMovies() {
            isLoading = true
            errorMessage = nil

            Task {
                defer {
                    DispatchQueue.main.async {
                        self.isLoading = false
                    }
                }
                await loadMovies()
            }
        }
    }
}
