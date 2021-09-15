import CoreUI_Resources
import RootElements
import SwiftUI

struct SearchAssetModel: Identifiable, Equatable {
    let id: UUID = .init()
    let image: Image
    let ticker: String
    let company: String
    let percentVariation: String
    let variation: Variation
    let value: String
    let isFavorite: Bool
}

#if DEBUG
// MARK: - Test Helpers
extension SearchAssetModel {
    static func mock() -> SearchAssetModel {
        SearchAssetModel(
            image: .init(.image(Asset.bankIcon(for: "655"))),
            ticker: "Ticker",
            company: "Company",
            percentVariation: "+2,32",
            variation: .positive,
            value: "23,12",
            isFavorite: false
        )
    }
}
#endif
