//
//  PopularHorizontalCell.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 19.02.2022.
//

import SwiftUI

struct PopularHorizontalCell: View {
    var movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                movie.posterImage
                    .resizable()
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 3)
            Text(movie.title ?? "")
                .bold()
        }
        .lineLimit(1)
    }
}

struct PopularHorizontalCell_Previews: PreviewProvider {
    static var previews: some View {
        PopularHorizontalCell(movie: MockData().movies[0])
    }
}
