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
    func filterMoviesByDateRange(lower: Date, upper: Date) -> [MovieViewModel] {
        return Movie.byDateRange(lower: lower, upper: upper).map(MovieViewModel.init)
    }
    func filterMoviesByDateRangeOrMinRating(lower: Date?, upper: Date?, minRating: Int?) -> [MovieViewModel] {
        return Movie.byDateRangeOrRating(lower: lower, upper: upper, minimumRating: minRating).map(MovieViewModel.init)
        
    }
}

