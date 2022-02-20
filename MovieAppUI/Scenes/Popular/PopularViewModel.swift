//
//  PopularViewModel.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 18.02.2022.
//

import Foundation
import MADNetwork

class PopularViewModel: ObservableObject {

    @Published var popularMovies: [Movie]?
    @Published var topRatedMovies: [Movie]?
    @Published var upcomingMovies: [Movie]?
    @Published var nowPlayingMovies: [Movie]?

    private let router: RouterProtocol
    var unitTestIsSuccess = false
    var unitTestNetworkError: NetworkingError = .undefined

    init(router: RouterProtocol = Router()) {
        self.router = router
    }

    func loadMovies(with type: MoviewListEndPoint) {
        let request = PopularMovieRequest(page: 1, with: type)

        self.router.fetchMovies(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movies):
                switch type {
                case .nowPlaying:
                    self.nowPlayingMovies = movies?.results
                case .popular:
                    self.popularMovies = movies?.results
                    self.unitTestIsSuccess = true
                case .topRated:
                    self.topRatedMovies = movies?.results
                case .upcoming:
                    self.upcomingMovies = movies?.results
                }
            case .failure(let error):
                self.unitTestNetworkError = error
                print(error.description ?? "")
            }
        }

    }
}
