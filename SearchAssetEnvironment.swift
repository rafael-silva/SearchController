import ComposableArchitecture

public struct SearchAssetEnvironment {
    var searchService: SearchAssetServiceProtocol
}

#if DEBUG
extension SearchAssetEnvironment {
    static func mocking(searchService: SearchAssetServiceProtocol = SearchAssetServiceFailing()) -> Self {
        var instance: Self = .init(searchService: searchService)
        return instance
    }
}
#endif
