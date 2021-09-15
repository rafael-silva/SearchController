import ComposableArchitecture
import Foundation

public typealias SearchAssetReducer = Reducer<SearchAssetState, SearchAssetAction, SearchAssetEnvironment>

let searchAssetReducer = SearchAssetReducer { _, action, _ in
    switch action {
    case let .updateSearchTerm(term):
        return .none

    case let .favorite(asset):
        return .none

    case let .openAssetDetail(id):
        return .none
    }
}
