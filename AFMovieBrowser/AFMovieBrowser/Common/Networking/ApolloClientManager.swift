//
//  ApolloClient.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import Foundation
import Apollo
import ApolloAPI

class ApolloClientManager {
    static let shared = ApolloClientManager()
    private let client: Apollo.ApolloClient

    private init() {
        client = Apollo.ApolloClient(url: URL(string: "https://graph.imdbapi.dev/v1")!)
    }

    /// Generic function to fetch GraphQL queries
    func fetch<Query: GraphQLQuery>(query: Query, completion: @escaping (Result<Query.Data?, Error>) -> Void) {
        client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                completion(.success(graphQLResult.data))
            case .failure(let error):
                completion(.failure(ApolloError.networkError(error)))
            }
        }
    }
}



