//
//  ShowFiltersScreen.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/17/21.
//

import SwiftUI

struct ShowFiltersScreen: View {
    
    @State private var releaseDate: String = ""
    @State private var startDate: String = ""
    @State private var endDate: String = ""
    @State private var minimumRating: String = ""
    @State private var movieTitle: String = ""
    @State private var actorName: String = ""
    
    @Binding var movies: [MovieViewModel]
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var filterVm = FiltersViewModel()
    
    var body: some View {
        Form {
            
            Section(header: Text("Search by release date")) {
                TextField("Enter release date", text: $releaseDate)
                HStack {
                    Spacer()
                    Button("Search") {
                        if let releaseDate = releaseDate.asDate() {
                            movies = filterVm.filterMoviesByReleaseDate(releaseDate: releaseDate)
                        }
                        
                        presentationMode.wrappedValue.dismiss()
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by date range")) {
                TextField("Enter start date", text: $startDate)
                TextField("Enter end date", text: $endDate)
                HStack {
                    Spacer()
                    Button("Search") {
                        guard let lower = startDate.asDate(), let upper = endDate.asDate() else {
                            return
                        }
                        movies = filterVm.filterMoviesByDateRange(lower: lower, upper: upper)
                        presentationMode.wrappedValue.dismiss()
                        
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by date range or rating")) {
                TextField("Enter start date", text: $startDate)
                TextField("Enter end date", text: $endDate)
                TextField("Enter minimum rating", text: $minimumRating)
                HStack {
                    Spacer()
                    Button("Search") {
                        let lowerBound = startDate.asDate()
                        let upperBound = endDate.asDate()
                        let minRating = Int(minimumRating)
                        movies = filterVm.filterMoviesByDateRangeOrMinRating(lower: lowerBound, upper: upperBound, minRating: minRating)
                        presentationMode.wrappedValue.dismiss()
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by movie title begins with")) {
                TextField("Enter movie title", text: $movieTitle)
                HStack {
                    Spacer()
                    Button("Search") {
                        movies = filterVm.filterMoviesByTitle(title: movieTitle)
                        presentationMode.wrappedValue.dismiss()
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
            Section(header: Text("Search by actor name")) {
                TextField("Enter actor name", text: $actorName)
                HStack {
                    Spacer()
                    Button("Search") {
                        movies = filterVm.filterMoviesByActor(actorName: actorName)
                        presentationMode.wrappedValue.dismiss()
                    }.buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
            
        }
        .navigationTitle("Filters")
        .embedInNavigationView()
    }
}

struct ShowFiltersScreen_Previews: PreviewProvider {
    static var previews: some View {
        ShowFiltersScreen(movies: .constant([MovieViewModel(movie: Movie())]))
    }
}
