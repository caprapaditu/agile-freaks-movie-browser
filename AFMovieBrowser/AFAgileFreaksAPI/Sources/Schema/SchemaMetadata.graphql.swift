// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == AFAgileFreaksAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == AFAgileFreaksAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == AFAgileFreaksAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == AFAgileFreaksAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Avatar": return AFAgileFreaksAPI.Objects.Avatar
    case "Credit": return AFAgileFreaksAPI.Objects.Credit
    case "Language": return AFAgileFreaksAPI.Objects.Language
    case "Name": return AFAgileFreaksAPI.Objects.Name
    case "Poster": return AFAgileFreaksAPI.Objects.Poster
    case "Query": return AFAgileFreaksAPI.Objects.Query
    case "Rating": return AFAgileFreaksAPI.Objects.Rating
    case "Title": return AFAgileFreaksAPI.Objects.Title
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
