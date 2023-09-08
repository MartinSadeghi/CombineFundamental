//
//  MovieViewModel.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 08/09/23.
//

import Foundation
import Combine

final class MovieViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    var cancellables = Set<AnyCancellable>()
    
    func fetchInitialData() {
        fetchMovies()
            .map(\.results)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:()
                case .failure(let err):
                    print(err.localizedDescription)
                }
            } receiveValue: { [weak self] movies in
                self?.movies = movies
            }
            .store(in: &cancellables)
    }
}
