//
//  PopularVerticalCell.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 19.02.2022.
//

import SwiftUI

struct PopularVerticalCell: View {
    var movie: Movie
    var body: some View {
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                movie.posterImage
                    .resizable()
            }
            .aspectRatio(contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            .frame(width: 200, height: 300)
    }
}

struct PopularVerticalCell_Previews: PreviewProvider {
    static var previews: some View {
        PopularVerticalCell(movie: MockData().movies[0])
    }
}
