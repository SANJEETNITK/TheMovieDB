//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Sanjeet Kumar on 25/08/21.
//

import UIKit



/// Movie List controller that controls the UI view of movies
class MovieListController: UIViewController {
    
    //MARK: variables
    var movieList: [Movie]? // List of Movie
    @IBOutlet weak var objTableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initializing movieData
        let objNetworking = Networking()
        
        objNetworking.response(url: ApiConstants.server_base_url.rawValue) {
            (movieResult) in
            self.movieList = movieResult.results
            
            DispatchQueue.main.async {
                self.objTableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
        
    }


}

//MARK: Extending UITableViewDelegate
extension MovieListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = self.storyboard?.instantiateViewController(identifier: "MovieDetailsVC") as? MovieDetailsVC
        if let detailsVC = detailsVC {
            detailsVC.movie = movieList?[indexPath.row]
            present(detailsVC, animated: true)
//            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
}

//MARK: Extending UITableViewDataSource
extension MovieListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        
        let movie = movieList?[indexPath.row]
        cell?.showData(movie: movie)
        return cell!
    }
}

