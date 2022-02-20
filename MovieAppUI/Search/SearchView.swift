//
//  SearchView.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()

    var body: some View {
        NavigationView {
            List {
                SearchBarView(placeHolder: "Search Movies", text: self.$viewModel.query)

                if self.viewModel.movies != nil {
                    ForEach(self.viewModel.movies!) { movie in
                        NavigationLink(destination: DetailView(movie: movie)) {
                            VStack(alignment: .leading) {
                                Text(movie.title!)
                                Text(movie.releaseDate!)
                            }
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            .navigationTitle("Search")
            .onAppear {
                self.viewModel.startObserve()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewDevice("iPhone 12")
    }
}
