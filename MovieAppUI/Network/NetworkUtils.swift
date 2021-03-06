//
//  NetworkUtils.swift
//  MovieAppPlus
//
//  Created by Safak Can Bas on 12.02.2022.
//

import Foundation

class NetworkUtils {
    static var posterPath = "https://themoviedb.org/t/p/original"
    static var apiKey = "4f9da36791283d432b3658ba4274469e"

    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()

    static let yearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
}
