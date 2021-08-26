//
//  Networking.swift
//  TheMovieDB
//
//  Created by Sanjeet Kumar on 25/08/21.
//

import Foundation

/* Networking functionaliy for grapping the Model subject to Codable Protocool */
class Networking {
    
    func response (url: String  , completion: @escaping (MovieData) -> ()) {
        
        guard let url = URL(string: url) else {return}
        
        let objUrlSession = URLSession.shared
        
        objUrlSession.dataTask(with: url, completionHandler: { (data , response , error ) in
            
            
            guard let data = data else {return}
            
            do {
                let jsondecoder = JSONDecoder()
                let movies = try jsondecoder.decode(MovieData.self, from: data)
                completion(movies)
                
            } catch {
                print("Error \(error)")
            }
            
        }).resume()
        
    }
}
