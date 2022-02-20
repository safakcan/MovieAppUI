//
//  ContentView.swift
//  MovieAppUI
//
//  Created by Safak Can Bas on 18.02.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        TabView {
            PopularView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv.inset.filled")
                        Text("Movies")
                    }
                }
                .tag(0)

            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)

            MovieLibraryView()
                .tabItem{
                    Image(systemName: "books.vertical.fill")
                    Text("Library")
            }
                .tag(2)
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MovieLibrary())
    }
}
