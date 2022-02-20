//
//  PopularHorizontalList.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 19.02.2022.
//

import SwiftUI

struct PopularHorizontalList: View {
    var movies: [Movie]
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 5) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: DetailView(movie: movie)) {
                            PopularHorizontalCell(movie: movie)
                                .frame(width: 270, height: 200)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first?.id ? 16 : 0 )
                        .padding(.trailing, movie.id == self.movies.last?.id ? 16 : 0 )
                    }
                }
            }
        }
    }
}

struct PopularHorizontalList_Previews: PreviewProvider {
    static var previews: some View {
        PopularHorizontalList(movies: MockData().movies, title: "Titlr")
    }
}
