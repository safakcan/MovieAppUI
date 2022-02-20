//
//  MovieLibrary.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import Foundation
import SwiftUI

class MovieLibrary: ObservableObject {
    
    @Published var movieArray: [Movie] = []

    func addMovieToLibrary(_ movie: Movie) {
        movieArray.append(movie)
    }

    func removeMovieFromLibrary(_ index: IndexSet) {
        movieArray.remove(atOffsets: index)
    }
}
