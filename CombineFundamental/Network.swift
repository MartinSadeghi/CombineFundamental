//
//  Network.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 07/09/23.
//

import Foundation
import Combine


func fetchMovies() -> some Publisher<MovieResponse, Error> {
    let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(Constant.apiKey)")!
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
//        .map { $0.data}
        .map(\.data)
        .decode(type: MovieResponse.self, decoder: jsonDecoder)
//        .tryMap { data in
//            let decoded = try jsonDecoder.decode(MovieResponse.self, from: data)
//            return decoded
//        }
//        .eraseToAnyPublisher()
}


func searchMovies(for query: String) -> some Publisher<MovieResponse, Error> {
    let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(Constant.apiKey)&query=\(encodedQuery!)")!
    return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .map{ $0.data }
        .decode(type: MovieResponse.self, decoder: jsonDecoder)
}
