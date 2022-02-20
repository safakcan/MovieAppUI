//
//  MockData.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 18.02.2022.
//

import Foundation

final class MockData: ObservableObject {

    @Published var popularMovies: PopularMovieResponse = load("MockMovie.json")

    var movies: [Movie] {
        popularMovies.results ?? []
    }
}

func load<PopularMovieResponse: Decodable>(_ filename: String) -> PopularMovieResponse {

    let data : Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldnt find\(filename)")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("couldnt load \(filename)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(PopularMovieResponse.self, from: data)
    } catch {
        fatalError("couldnt decode \(filename)")
    }
}
