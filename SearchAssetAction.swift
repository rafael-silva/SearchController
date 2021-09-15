import Foundation

public enum SearchAssetAction: Equatable {
    case updateSearchTerm(String)
    case favorite(String)
    case openAssetDetail(String)
}
