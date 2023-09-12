//
//  ContentView.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 05/09/23.
//

import SwiftUI

struct MoviesView: View {
    @StateObject var movieViewModel = MovieViewModel()
    var body: some View {
        List(movieViewModel.movies) { movie in
            HStack {
                AsyncImage(url: movie.posterURL) { poster in
                    poster
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100)
                }
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .font(.caption)
                        .lineLimit(3)
                }
            }
        }
        .navigationTitle("Upcoming movies")
        .searchable(text: $movieViewModel.searchQuery)
        .onAppear {
            movieViewModel.fetchInitialData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
