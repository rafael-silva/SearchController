import Combine
import CoreProviders
import Foundation
import RootElements
import SwiftApolloClient

public protocol SearchAssetServiceProtocol {
    func requestAssets(searchString: String) -> AnyPublisher<SearchAssetModelResponse, Error>
    func favoriteAsset() -> AnyPublisher<Bool, Error>
}

public final class SearchAssetService: SearchAssetServiceProtocol {
    // TODO: Extract this to repository
    public init () {}

    public func requestAssets(searchString: String) -> AnyPublisher<SearchAssetModelResponse, Error> {
        Just(SearchAssetModelResponse.fixture())
            .mapToError()
            .eraseToAnyPublisher()
    }

    public func favoriteAsset() -> AnyPublisher<Bool, Error> {
        Just(true)
            .mapToError()
            .eraseToAnyPublisher()
    }
}

#if DEBUG
// MARK: - Test Helpers
import XCTestDynamicOverlay

final class SearchAssetServiceFailing: SearchAssetServiceProtocol {
    func requestAssets(searchString: String) -> AnyPublisher<SearchAssetModelResponse, Error> {
        XCTFail("SearchAssetService.assetValue unimplemented")
        return Empty().eraseToAnyPublisher()
    }

    func favoriteAsset() -> AnyPublisher<Bool, Error> {
        XCTFail("SearchAssetService.assetValue unimplemented")
        return Empty().eraseToAnyPublisher()
    }
}
#endif
