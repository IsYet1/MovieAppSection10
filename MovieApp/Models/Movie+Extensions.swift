//
//  Movie+Extensions.swift
//  MovieApp
//
//  Created by Mohammad Azam on 3/11/21.
//

import Foundation
import CoreData

extension Movie: BaseModel {
    
    static func byDateRange(lower: Date, upper: Date) -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@ AND %K <= %@",
                                        #keyPath(Movie.releaseDate),
                                        lower as NSDate,
                                        #keyPath(Movie.releaseDate),
                                        upper as NSDate
        )
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
    }
    
    static func byReleaseDate(releaseDate: Date) -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "%K >= %@", #keyPath(Movie.releaseDate), releaseDate as NSDate)
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
    }
    
    static func byActorName(name: String) -> [Movie] {
        
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        request.predicate = NSPredicate(format: "actors.name CONTAINS %@", name)
        
        do {
            return try viewContext.fetch(request)
        } catch {
            print(error)
            return []
        }
        
    }
    
}
