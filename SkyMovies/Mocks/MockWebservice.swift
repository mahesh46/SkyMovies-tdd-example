//
//  MockWebservice.swift
//  SkyMovies
//
//  Created by mahesh lad on 22/05/2023.
//

import Foundation

class MockWebservice: NetworkService {
    func getMovies(searchTerm: String) async throws -> [Movie] {
        if searchTerm == "Batman" {
            // swiftlint:disable:next line_length
            let movie = Movie(imdbID: "tt0096895", title: "Batman", poster: "https://m.media-amazon.com/images/M/MV5BZDNjOGNhN2UtNmNhMC00YjU4LWEzMmUtNzRkM2RjN2RiMjc5XkEyXkFqcGdeQXVyMTU0OTM5ODc1._V1_SX300.jpg")
            return [movie]
        } else {
            return []
        }
    }
}
