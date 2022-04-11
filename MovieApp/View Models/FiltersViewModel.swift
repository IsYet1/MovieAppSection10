//
//  FiltersViewModel.swift
//  MovieApp
//
//  Created by Don McKenzie on 11-Apr-22.
//

import Foundation

class FiltersViewModel: ObservableObject {
    func filterMoviesByReleaseDate(releaseDate: Date) -> [MovieViewModel] {
        return Movie.byReleaseDate(releaseDate: releaseDate).map(MovieViewModel.init)
    }
}

