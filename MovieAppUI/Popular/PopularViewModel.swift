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

//    init(popularMovies: PopularMovieResponse) {
//        self.popularMovies = popularMovies
//    }

    func loadMovies(with type: MoviewListEndPoint) {
        let request = PopularMovieRequest(page: 1, with: type)
        NetworkManager.shared.execute(request: request, completion: { [weak self] response in
                   guard let self = self else {return}
                   switch response.result {
                   case .success(let result):
                       guard let movieResult = result.results else { return }

                       switch type {
                       case .nowPlaying:
                           self.nowPlayingMovies = result.results
                       case .popular:
                           self.popularMovies = result.results
                       case .topRated:
                           self.topRatedMovies = result.results
                       case .upcoming:
                           self.upcomingMovies = result.results
                       }
                   case .failure(let error):
                       print(error)
                   }
               })
           }
}
