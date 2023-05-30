//
//  Movie.swift
//  SkyMovies
//
//  Created by mahesh lad on 22/05/2023.
//

import Foundation

struct MovieResponse: Decodable {
    let movies: [Movie]
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}

struct Movie: Decodable {
    let imdbID: String
    let title: String
    let poster: String
    private enum CodingKeys: String, CodingKey {
        case imdbID = "imdbID"
        case title = "Title"
        case poster = "Poster"
    }
}
