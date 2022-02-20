//
//  DetailView.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 20.02.2022.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie

    var body: some View {
        List{
            DetailImageView(movie: movie)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            HStack {
                Text(movie.releaseDate ?? "")
            }
            Text(movie.overview)
            HStack {
//                Add starts
//                Add vote average percentage
            }
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle(movie.title ?? "Detail")
    }
}

struct DetailImageView: View {
    var movie: Movie
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            movie.posterImage
                .resizable()
        }
        .aspectRatio(16/9, contentMode: .fit)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(movie: MockData().movies[1])
        }
    }
}
