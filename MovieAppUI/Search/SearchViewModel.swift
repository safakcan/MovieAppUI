//
//  SearchViewModel.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import Foundation
import SwiftUI
import Combine
import MADNetwork

class SearchViewModel: ObservableObject {

    @Published var query = ""
    @Published var movies: [Movie]?
    private var subscriptionToken: AnyCancellable?

    func startObserve() {
        guard subscriptionToken == nil else { return }

        self.subscriptionToken = self.$query
            .map { [weak self] text in
                self?.movies = nil
                return text
            }
            .throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
            .sink{[weak self] in self?.search(query: $0)}
    }

    func search(query: String) {
        self.movies = nil

        guard !query.isEmpty else {return}

        let request = SearchMovieRequest(query: query)

        NetworkManager.shared.execute(request: request, completion: { [weak self] response in
            guard let self = self else {return}
            switch response.result {
            case .success(let result):
                self.movies = result.results
            case .failure(let error):
                print(error)
            }
        })
    }

    deinit {
        self.subscriptionToken?.cancel()
        self.subscriptionToken = nil
    }
}

