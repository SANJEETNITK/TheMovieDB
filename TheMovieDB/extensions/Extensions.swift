//
//  Extensions.swift
//  TheMovieDB
//
//  Created by Sanjeet Kumar on 25/08/21.
//

import UIKit

extension UIImageView {
    
    /// Loads image from server and calls the completion
    /// - Parameters:
    ///   - urlString: String of the url
    ///   - completion: completion closure
    /// - Returns: calls completion after complete download of the image
    func loadImageFromServer(urlString: String, completion: @escaping (UIImage) -> ()) {
        guard let url = URL(string: urlString) else {
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    completion(image)
                }
            }
        }
    }
}
