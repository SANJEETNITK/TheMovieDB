//
//  MovieDetailsVC.swift
//  TheMovieDB
//
//  Created by Sanjeet Kumar on 25/08/21.
//

import UIKit

class MovieDetailsVC: UIViewController {
    
    var movie: Movie?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var popularityScore: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setmovieDetails()
    }
    
    func setmovieDetails() {
        movieImage.loadImageFromServer(urlString: ApiConstants.image_base_url.rawValue + (movie?.poster_path ?? "")) {
            (image) in
            DispatchQueue.main.async {
                self.movieImage.image = image
                self.activityIndicator.stopAnimating()
            }
        }
        movieTitle.text = "Title: " + (movie?.title ?? "")
        releaseDate.text = "Release Date: " + (movie?.release_date ?? "")
        popularityScore.text = "Popularity Score: " + String(movie?.popularity ?? 0)
    }
}
