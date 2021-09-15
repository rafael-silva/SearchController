import CoreUI
import CoreUI_Resources
import RootElements
import SwiftUI

public struct SearchAssetModelResponse {
    let image: Image
    let ticker: String
    let company: String
    let percentVariation: String
    let variation: Variation
    let value: String
    let isFavorite: Bool
}
#if DEBUG
extension SearchAssetModelResponse {
    static func fixture(
        image: Image = .init(.image(Asset.bankIcon(for: "655"))),
        ticker: String = "Ticker",
        company: String = "Company",
        percentVariation: String = "+2,12",
        variation: Variation = .positive,
        value: String = "R$13,34",
        isFavorite: Bool = false
    ) -> Self {
        .init(
            image: image,
            ticker: ticker,
            company: company,
            percentVariation: percentVariation,
            variation: variation,
            value: value,
            isFavorite: isFavorite
        )
    }
}
#endif
