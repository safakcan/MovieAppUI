//
//  SearchMovieRequest.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import Foundation
import MADNetwork

struct SearchMovieRequest: MovieAPIEndpoint {

    typealias Response = PopularMovieResponse

    var method: HTTPMethod = .get
    var path: String = "/3/search/movie"
    var parameters: [String : Any]? = [:]

    init(query: String) {
        self.parameters = [
            "api_key": NetworkUtils.apiKey,
            "query": query
        ]
    }
}
