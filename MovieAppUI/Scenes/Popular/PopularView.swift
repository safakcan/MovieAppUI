//
//  PopularView.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 18.02.2022.
//

import SwiftUI

struct PopularView: View {
    
    @ObservedObject private var viewModel = PopularViewModel()

    var body: some View {
        NavigationView {
            List {
                Group {
                    if viewModel.popularMovies != nil {
                        PopularVerticalList(movies: viewModel.popularMovies!, title: "Popular")
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if viewModel.upcomingMovies != nil {
                        PopularHorizontalList(movies: viewModel.upcomingMovies!, title: "Upcoming")
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if viewModel.topRatedMovies != nil {
                        PopularHorizontalList(movies: viewModel.topRatedMovies!, title: "Top Rated")
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))

                Group {
                    if viewModel.nowPlayingMovies != nil {
                        PopularHorizontalList(movies: viewModel.nowPlayingMovies!, title: "Now Playing")
                    }
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("MovieDB")
        }
        .onAppear {
            viewModel.loadMovies(with: .popular)
            viewModel.loadMovies(with: .nowPlaying)
            viewModel.loadMovies(with: .upcoming)
            viewModel.loadMovies(with: .topRated)
        }
    }
}

struct PopularView_Previews: PreviewProvider {
    static var previews: some View {
        PopularView()
    }
}
