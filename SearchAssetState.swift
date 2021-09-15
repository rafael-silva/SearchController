import ComposableArchitecture
import CoreUI
import CoreUI_Resources
import CoreUI_Tokens
import Foundation
import RootElements

public struct SearchAssetState: Equatable {
    var searchTerm: String = ""
    var isFiltering: Bool = false
    var filteredItems: [SearchAssetModel] = []
    var assets: [SearchAssetModel] = mockAssets
}

#if DEBUG
// MARK: - Test Helpers
extension SearchAssetState {
    static var mockAssets: [SearchAssetModel] {
        [
            .init(image: .init(.image(Asset.bankIcon(for: "655"))), ticker: "Tikcer", company: "Company", percentVariation: "+3,21", variation: .positive, value: "R$12,54", isFavorite: true),
            .init(image: .init(.image(Asset.bankIcon(for: "655"))), ticker: "Tikcer", company: "Company", percentVariation: "+3,21", variation: .positive, value: "R$12,54", isFavorite: false),
            .init(image: .init(.image(Asset.bankIcon(for: "655"))), ticker: "Tikcer", company: "Company", percentVariation: "+3,21", variation: .positive, value: "R$12,54", isFavorite: false),
            .init(image: .init(.image(Asset.bankIcon(for: "655"))), ticker: "Tikcer", company: "Company", percentVariation: "+3,21", variation: .positive, value: "R$12,54", isFavorite: false),
            .init(image: .init(.image(Asset.bankIcon(for: "655"))), ticker: "Tikcer", company: "Company", percentVariation: "+3,21", variation: .positive, value: "R$12,54", isFavorite: true)
        ]
    }

    static func fixture(
        searchTerm: String = "",
        isFiltering: Bool = false,
        filteredItems: [SearchAssetModel] = [],
        assets: [SearchAssetModel] = mockAssets
    ) -> Self {
        .init(
            searchTerm: searchTerm,
            isFiltering: isFiltering,
            filteredItems: filteredItems,
            assets: assets
        )
    }
}
#endif
