import ComposableArchitecture
import CoreUI
import CoreUI_Resources
import CoreUI_Tokens
import RootElements
import SwiftUI

struct SearchAssetView: View {
    // MARK: - Properties
    @Environment(\.theme) private var theme: Theme
    private let store: Store<SearchAssetState, SearchAssetAction>

    // MARK: - Initialization

    init(store: Store<SearchAssetState, SearchAssetAction>) {
        self.store = store
    }

    var body: some View {
        CustomNavigationView(
            view: AnyView(listContent),
            onSearch: {text in
                print("TEXTO DE BUSCA: \(text)")
            },
            onCancel: {
                print("CANCEL ATIVADO")
            }
        )
        .background(theme[color: \.backgroundSecondary])
        .edgesIgnoringSafeArea(.all)
        .navigationContentViewStyle(WrnContentNavigationViewStyle())
    }

    private var listContent: some View {
        Group {
            List {
                sectionHighlights
                sectionMostTraded
                sectionForYou
                sectionBiggestHighsDay
            }
            .listStyle(WrnGroupedListStyle())
        }
    }

    private var sectionHighlights: some View {
        // TODO; Buske terminando os cards, assim que feito merge do PR, adiconar aqui.
        Section(
            header: WrnHeader(.init(title: "Destaques da bolsa")),
            content: { EmptyView() }
        )
    }

    private var sectionMostTraded: some View {
        Section(
            header: descriptionHeader(
                title: "As mais negociadas",
                subtitle: "Empresas com maior volume de negociação hoje na Warren."
            ),
            content: {
                WithViewStore(store) { viewStore in
                    ForEach(viewStore.assets) { asset in
                        assetRow(
                            image: .image(Asset.bankIcon(for: "655")),
                            title: asset.ticker,
                            subtitle: asset.company,
                            percentVariation: asset.percentVariation,
                            variation: asset.variation,
                            value: asset.value,
                            isFavorite: asset.isFavorite
                        )
                    }
                }
            }
        )
    }

    private var sectionForYou: some View {
        // TODO; Buske terminando os cards, assim que feito merge do PR, adiconar aqui.
        Section(
            header: descriptionHeader(
                title: "Para você",
                subtitle: "Recomendado com base no seu perfil"
            ),
            content: { EmptyView() }
        )
    }

    private var sectionBiggestHighsDay: some View {
        WithViewStore(store) { viewStore in
            Section(
                header: descriptionHeader(
                    title: "Maiores altas do dia",
                    subtitle: "Hoje, 14:27."
                ),
                content: {
                    ForEach(viewStore.state.assets) { asset in
                        assetRow(
                            image: .image(Asset.bankIcon(for: "655")),
                            title: asset.ticker,
                            subtitle: asset.company,
                            percentVariation: asset.percentVariation,
                            variation: asset.variation,
                            value: asset.value,
                            isFavorite: asset.isFavorite
                        )
                    }
                }
            )
        }
    }

    private func descriptionHeader(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading) {
            WrnText(title)
                .textStyle(.init(\.paragraph2Bold, \.textPrimary))

            WrnText(subtitle)
                .textStyle(.init(\.paragraph5, \.textSecondary))
                .fixedSize(horizontal: false, vertical: false)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            Spacer()
        }
    }

    private func assetRow(
        image: ImageToken,
        title: String,
        subtitle: String,
        percentVariation: String,
        variation: Variation,
        value: String,
        isFavorite: Bool,
        onFavoriteAction: @escaping () -> Void = { }
    ) -> some View {
        TradeAssetRow(
            asset: .init(
                image: image,
                ticker: title,
                company: subtitle,
                percentVariation: percentVariation,
                variation: variation,
                isRedactable: false,
                value: value
            )
        )
        .withFavoriteButton(isFavorite: isFavorite, performAction: onFavoriteAction)
    }
}

private extension View {
    func withFavoriteButton(
        isFavorite: Bool,
        performAction: @escaping () -> Void = { }
    ) -> some View {
        HStack(alignment: .firstTextBaseline) {
            self

            Button(
                action: {
                    // TODO: do anything here
                    performAction()
                },
                label: {
                    Image(isFavorite ? .symbol(.heartFill) : .symbol(.heart))
                        .foregroundColor(\.elementPrimary)
                }
            )
            .buttonStyle(PlainButtonStyle())
        }
    }
}
