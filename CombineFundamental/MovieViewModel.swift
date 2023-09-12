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
    @Published var movies: [Movie] = []
    @Published var searchQuery: String = ""
    
    func fetchInitialData() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
        
//        first way
            .replaceError(with: [])
            .assign(to: &$movies)
        
        
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
}
