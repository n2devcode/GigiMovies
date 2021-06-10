//
//  MovieTableViewCell.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var moviesTableView = UITableView()
    var movieId = 0
    var isFavorite = false
    var moviesVC = ViewController() {
        didSet {
            isFavorite = moviesVC.favoriteMovies.containsId(movieId)
            favoriteButton.setTitle("Favorita: \(isFavorite ? "Sí" : "No")", for: .normal)
        }
    }
    
    @IBAction func clickFavorite(_ sender: Any) {
        if isFavorite {
            moviesVC.favoriteMovies = moviesVC.favoriteMovies.removeId(movieId)
        } else {
            moviesVC.favoriteMovies = moviesVC.favoriteMovies.addId(movieId)
        }
        moviesVC.userRepository.saveFavoritesUserInfo(moviesVC.favoriteMovies)
        moviesTableView.reloadData()
    }
    
}
