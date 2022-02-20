//
//  MovieLibraryView.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import SwiftUI

struct MovieLibraryView: View {

    @EnvironmentObject var library: MovieLibrary

    var body: some View {
        List {
            ForEach(library.movieArray) { movie in
                HStack(alignment:.center,spacing: 10) {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                        movie.posterImage
                            .resizable()
                    }
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                    .frame(width: 150, height: 150)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(movie.title ?? "")
                        Text(movie.yearText)
                    }
                }
            }
            .onDelete(perform: delete)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 10, trailing: 5))
        }
        .listStyle(PlainListStyle())

    }

    func delete(at offsets: IndexSet) {
        library.removeMovieFromLibrary(offsets)
    }

}

struct MovieLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        MovieLibraryView()
            .environmentObject(MovieLibrary())
    }
}
