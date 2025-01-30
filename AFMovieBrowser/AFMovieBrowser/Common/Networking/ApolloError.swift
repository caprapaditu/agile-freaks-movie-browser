//
//  ApolloError.swift
//  AFMovieBrowser
//
//  Created by Capra Razvan on 29.01.2025.
//

import Foundation
import Apollo

/// Custom error type for better error handling
enum ApolloError: Error {
    case graphQLErrors([GraphQLError])
    case networkError(Error)
}
