// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MovieDetailsQuery: GraphQLQuery {
  public static let operationName: String = "movieDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query movieDetails($id: ID!) { title(id: $id) { __typename id type primary_title posters { __typename url width height } rating { __typename aggregate_rating votes_count } genres runtime_minutes is_adult spoken_languages { __typename code name } plot casts: credits(first: 5, categories: ["actor", "actress"]) { __typename name { __typename id display_name avatars { __typename url width height } } characters } } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: AFAgileFreaksAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("title", Title?.self, arguments: ["id": .variable("id")]),
    ] }

    public var title: Title? { __data["title"] }

    /// Title
    ///
    /// Parent Type: `Title`
    public struct Title: AFAgileFreaksAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Title }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", AFAgileFreaksAPI.ID.self),
        .field("type", String.self),
        .field("primary_title", String.self),
        .field("posters", [Poster]?.self),
        .field("rating", Rating?.self),
        .field("genres", [String]?.self),
        .field("runtime_minutes", Int?.self),
        .field("is_adult", Bool.self),
        .field("spoken_languages", [Spoken_language]?.self),
        .field("plot", String?.self),
        .field("credits", alias: "casts", [Cast]?.self, arguments: [
          "first": 5,
          "categories": ["actor", "actress"]
        ]),
      ] }

      /// The unique IMDb ID for the title. Each IMDb ID appears exactly once.
      public var id: AFAgileFreaksAPI.ID { __data["id"] }
      /// The type of this title, e.g. 'movie' or 'tvSeries'.
      public var type: String { __data["type"] }
      /// The primary title text of the title.
      public var primary_title: String { __data["primary_title"] }
      /// A list of posters.
      public var posters: [Poster]? { __data["posters"] }
      /// The IMDb Rating.
      public var rating: Rating? { __data["rating"] }
      /// A list of genres to which this title belongs.
      public var genres: [String]? { __data["genres"] }
      /// The running time of this title in minutes.
      public var runtime_minutes: Int? { __data["runtime_minutes"] }
      /// Whether or not this title contains adult content.
      public var is_adult: Bool { __data["is_adult"] }
      /// A list of the languages spoken in this title.
      public var spoken_languages: [Spoken_language]? { __data["spoken_languages"] }
      /// A plot description.
      public var plot: String? { __data["plot"] }
      /// A list of credits for this title organized by category.
      public var casts: [Cast]? { __data["casts"] }

      /// Title.Poster
      ///
      /// Parent Type: `Poster`
      public struct Poster: AFAgileFreaksAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Poster }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("url", String.self),
          .field("width", Int.self),
          .field("height", Int.self),
        ] }

        public var url: String { __data["url"] }
        public var width: Int { __data["width"] }
        public var height: Int { __data["height"] }
      }

      /// Title.Rating
      ///
      /// Parent Type: `Rating`
      public struct Rating: AFAgileFreaksAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Rating }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("aggregate_rating", Double.self),
          .field("votes_count", Int.self),
        ] }

        /// Between 1 and 10 and given to one decimal place.
        public var aggregate_rating: Double { __data["aggregate_rating"] }
        /// The number of IMDb users who have voted on this title.
        public var votes_count: Int { __data["votes_count"] }
      }

      /// Title.Spoken_language
      ///
      /// Parent Type: `Language`
      public struct Spoken_language: AFAgileFreaksAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Language }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("code", String.self),
          .field("name", String.self),
        ] }

        /// ISO 639-3 language codes (three-letter).
        public var code: String { __data["code"] }
        /// English name of Language.
        public var name: String { __data["name"] }
      }

      /// Title.Cast
      ///
      /// Parent Type: `Credit`
      public struct Cast: AFAgileFreaksAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Credit }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("name", Name?.self),
          .field("characters", [String]?.self),
        ] }

        /// A IMDB name that the person was credited.
        public var name: Name? { __data["name"] }
        /// A list of characters.
        public var characters: [String]? { __data["characters"] }

        /// Title.Cast.Name
        ///
        /// Parent Type: `Name`
        public struct Name: AFAgileFreaksAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Name }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", AFAgileFreaksAPI.ID.self),
            .field("display_name", String.self),
            .field("avatars", [Avatar]?.self),
          ] }

          /// The unique IMDb ID for the name. Each IMDb ID appears exactly once.
          public var id: AFAgileFreaksAPI.ID { __data["id"] }
          /// The primary name by which this person is known, usually the one by which they are most often credited.
          public var display_name: String { __data["display_name"] }
          /// A list of avatars.
          public var avatars: [Avatar]? { __data["avatars"] }

          /// Title.Cast.Name.Avatar
          ///
          /// Parent Type: `Avatar`
          public struct Avatar: AFAgileFreaksAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: any ApolloAPI.ParentType { AFAgileFreaksAPI.Objects.Avatar }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("url", String.self),
              .field("width", Int.self),
              .field("height", Int.self),
            ] }

            public var url: String { __data["url"] }
            public var width: Int { __data["width"] }
            public var height: Int { __data["height"] }
          }
        }
      }
    }
  }
}
