import SwiftUI

public struct CustomNavigationView: UIViewControllerRepresentable {
    public func makeCoordinator() -> Coordinator {
        return CustomNavigationView.Coordinator(parent: self)
    }

    var view: AnyView
    var onSearch: (String) -> Void
    var onCancel: () -> Void

    public init(
        view: AnyView,
        onSearch: @escaping (String) -> Void,
        onCancel: @escaping () -> Void
    ) {
        self.view = view
        self.onSearch = onSearch
        self.onCancel = onCancel
    }

    public func makeUIViewController(context: Context) -> some UINavigationController {
        let childView = UIHostingController(rootView: view)

        let searchController = UISearchController()
        searchController.searchBar.placeholder = ""
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = context.coordinator

        let controller = UINavigationController(rootViewController: childView)

        controller.navigationBar.topItem?.title = "Buscar ativo"
        controller.navigationBar.prefersLargeTitles = false
        controller.navigationBar.topItem?.hidesSearchBarWhenScrolling = false
        controller.navigationBar.topItem?.searchController = searchController

        return controller
    }

    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    public class Coordinator: NSObject, UISearchBarDelegate {
        var parent: CustomNavigationView

        init(parent: CustomNavigationView) {
            self.parent = parent
        }

        public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // When text change
            parent.onSearch(searchText)
        }

        public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // When cancel button is clicked
            parent.onCancel()
        }
    }
}
