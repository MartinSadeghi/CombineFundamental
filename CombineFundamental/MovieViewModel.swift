//
//  MovieViewModel.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 08/09/23.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    @Published private var upcomingMovies: [Movie] = []
    @Published var searchQuery: String = ""
    @Published private var searchResults: [Movie] = []
    
    var movies: [Movie] {
        if searchQuery.isEmpty {
            return upcomingMovies
        } else {
            return searchResults
        }
    }
    
    
    init() {
        searchMovie()
    }
    
    func fetchInitialData() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
        
//        first way
            .replaceError(with: [])
            .assign(to: &$upcomingMovies)
        
        
//        second way
//            .sink { completion in
//                switch completion {
//                case .finished:()
//                case .failure(let err):
//                    print(err.localizedDescription)
//                }
//            } receiveValue: { [weak self] movies in
//                self?.movies = movies
//            }
//            .store(in: &cancellables)
    }
    
    func searchMovie() {
        $searchQuery
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { searchQuery in
                searchMovies(for: searchQuery)
                    .replaceError(with: MovieResponse(results: []))
            }
            .switchToLatest()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .assign(to: &$searchResults)
    }
}
