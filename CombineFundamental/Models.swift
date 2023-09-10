//
//  Models.swift
//  CombineFundamental
//
//  Created by Mommo Sadeghi on 07/09/23.
//

import Foundation


struct Movie: Equatable, Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    var posterURL: URL? {
        posterPath.map {
            URL(string: "https://image.tmdb.org/t/p/w400/\($0)")!
        }
    }
}



struct MovieResponse: Decodable {
    let results: [Movie]
}


let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
