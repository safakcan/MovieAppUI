//
//  MockRouterService.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//
import MADNetwork
@testable import MovieAppUI

final class MockRouterService: RouterProtocol {

    var fetchResult: Result<PopularMovieResponse?, NetworkingError> = .success(PopularMovieResponse())

    func fetchMovies(request: PopularMovieRequest, completion: @escaping (Result<PopularMovieResponse?, NetworkingError>) -> Void) {
        completion(fetchResult)
    }

    func fetchSearch(request: SearchMovieRequest, completion: @escaping (Result<PopularMovieResponse?, NetworkingError>) -> Void) {
        completion(fetchResult)
    }

}
