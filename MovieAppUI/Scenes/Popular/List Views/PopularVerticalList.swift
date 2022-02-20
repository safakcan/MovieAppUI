//
//  PopularVerticalList.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 19.02.2022.
//

import SwiftUI

struct PopularVerticalList: View {
    var movies: [Movie]
    var title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: DetailView(movie: movie)) {
                            PopularVerticalCell(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first?.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last?.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct PopularVerticalList_Previews: PreviewProvider {
    static var previews: some View {
        PopularVerticalList(movies: MockData().movies, title: "Now PLayin")
    }
}
