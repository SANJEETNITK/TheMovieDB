//
//  CustomCell.swift
//  TheMovieDB
//
//  Created by Sanjeet Kumar on 25/08/21.
//

import UIKit


/// Custom Row for MovieData Table
class CustomCell: UITableViewCell {
    
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var popularityScoreLabel: UILabel!
    
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showData(movie: Movie?) -> Void {
        self.movieImage.loadImageFromServer(urlString: ApiConstants.image_base_url.rawValue + (movie?.poster_path ?? "")){
            (image) in
            DispatchQueue.main.async {
                self.movieImage.image = image
            }
        }
        self.titleLabel.text = (movie?.title ?? "")
        self.releaseYearLabel.text = "Release Date: " + (movie?.release_date ?? "")
        self.popularityScoreLabel.text = "Popularity Score: " + String(movie?.popularity! ?? 0)
    }

}
