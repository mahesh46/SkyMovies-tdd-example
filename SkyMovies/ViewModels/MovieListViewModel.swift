//
//  MovieListViewModel.swift
//  SkyMovies
//
//  Created by mahesh lad on 22/05/2023.
//

import Foundation


class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieViewModel] = []
    private var service: NetworkService
    init(service: NetworkService) {
    self.service = service
    }
    @MainActor func search(name: String) async -> [MovieViewModel] {
        do {
            let movies = try await self.service.getMovies(searchTerm: name)
            self.movies = movies.map(MovieViewModel.init)
            return  self.movies
        } catch {
            print(error)
            return []
        }
    }
}

struct MovieViewModel {
    let movie: Movie
    var imdbId: String {
        movie.imdbID
    }
    var title: String {
        movie.title
    }
    var poster: URL? {
        URL(string: movie.poster)
    }
}
