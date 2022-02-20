//
//  PopularMovieRequest.swift
//  MovieAppPlus
//
//  Created by Safak Can Bas on 12.02.2022.
//

import Foundation
import MADNetwork

struct PopularMovieRequest: MovieAPIEndpoint {

    typealias Response = PopularMovieResponse

    var method: HTTPMethod = .get
    var path: String = "/3/movie/"
    var parameters: [String : Any]? = [:]

    init(page: Int, with endPointType: MoviewListEndPoint) {
        self.path += endPointType.rawValue
        self.parameters = [
            "api_key": NetworkUtils.apiKey,
            "page": page
        ]
    }
}

enum MoviewListEndPoint: String {
    case popular = "popular"
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    case upcoming = "upcoming"
}
