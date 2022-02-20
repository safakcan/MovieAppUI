//
//  Router.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import Foundation
import MADNetwork

protocol RouterProtocol {
    func fetchMovies(
        request: PopularMovieRequest,
        completion: @escaping (Result<PopularMovieResponse?, NetworkingError>) -> Void
    )
    func fetchSearch(
        request: SearchMovieRequest,
        completion: @escaping (Result<PopularMovieResponse?, NetworkingError>) -> Void
    )
}

final class Router: RouterProtocol {

    func fetchMovies(
        request: PopularMovieRequest,
        completion: @escaping (Result<PopularMovieResponse?, NetworkingError>) -> Void
    ) {
        NetworkManager.shared.execute(request: request, completion: { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }

    func fetchSearch(
        request: SearchMovieRequest,
        completion: @escaping (Result<PopularMovieResponse?, NetworkingError>) -> Void
    ) {
        NetworkManager.shared.execute(request: request, completion: { response in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
