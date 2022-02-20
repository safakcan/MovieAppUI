//
//  SearchBarView.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {

    let placeHolder: String
    @Binding var text: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchbar = UISearchBar()
        searchbar.placeholder = placeHolder
        searchbar.searchBarStyle = .minimal
        searchbar.enablesReturnKeyAutomatically = false
        searchbar.delegate = context.coordinator
        return searchbar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}
