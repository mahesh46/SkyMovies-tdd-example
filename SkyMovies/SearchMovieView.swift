//
//  ContentView.swift
//  SkyMovies
//
//  Created by mahesh lad on 22/05/2023.
//

import SwiftUI

struct SearchMovieView: View {
  //  @StateObject private var movieListVM = MovieListViewModel(service: Webservice() )
    @StateObject private var movieListVM = MovieListViewModel(service: NetworkServiceFactory.create() )
    @State private var searchText: String = ""
    var body: some View {
        NavigationStack {
            List(movieListVM.movies, id: \.imdbId) { movie in
                HStack {
                    AsyncImage(url: movie.poster
                               , content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 100)
                    }, placeholder: {
                        ProgressView()
                    })
                    Text(movie.title)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .background(Color( .lightGray))
                .frame( maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 10, y: 10)
            }.listStyle(.plain)
                .searchable(text: $searchText)
                .onChange(of: searchText) { value in
                    Task {
                        if !value.isEmpty &&  value.count > 3 {
                            await _ = movieListVM.search(name: value)
                        } else {
                            movieListVM.movies.removeAll()
                        }
                    }
                }
//                .navigationDestination(for: Movie.self) { movie in
//                        MovieDetails(movie: movie)
//                    }
                .navigationTitle("Movies")
        }
    }
}

struct SearchMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieView()
    }
}
