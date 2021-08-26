//
//  Movie.swift
//  TheMovieDB
//
//  Created by Sanjeet Kumar on 25/08/21.
//

import Foundation

struct MovieData: Codable {
    var results: [Movie]?
}

/// Movie Structure
struct Movie: Codable {
    
    //MARK: Variables
    var poster_path: String?
    var title: String?
    var popularity: Float?
    var release_date: String?
}
