//
//  PopularMovieResponse.swift
//  MovieAppPlus
//
//  Created by Safak Can Bas on 13.02.2022.
//

import SwiftUI
import Kingfisher

struct PopularMovieResponse : Codable {
    var totalPages: Int?
    var results : [Movie]?
}

class Movie: Codable {
    var title : String?
    var originalTitle : String?
    var overview : String
    private var posterPath : String?
    var releaseDate : String?
    var voteAverage : Float?
    var posterImage : KFImage {
        KFImage.url(URL(string: NetworkUtils.posterPath + (posterPath ?? "")))
            .onSuccess { r in
            }
            .placeholder { p in
                ProgressView(p)
            }
    }
        enum CodingKeys: String, CodingKey {
            case releaseDate = "release_date"
            case posterPath = "poster_path"
            case originalTitle = "original_title"
            case voteAverage = "vote_average"
            case overview,title
        }
}

extension Movie: Hashable,Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

extension Movie: Equatable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs === rhs
    }
}
