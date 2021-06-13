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
    var moviesVM = MovieListViewModel() {
        didSet {
            isFavorite = moviesVM.favoriteMovies.containsId(movieId)
            favoriteButton.setTitle("Favorita: \(isFavorite ? "Sí" : "No")", for: .normal)
        }
    }
    
    @IBAction func clickFavorite(_ sender: Any) {
        if isFavorite {
            moviesVM.favoriteMovies = moviesVM.favoriteMovies.removeId(movieId)
        } else {
            moviesVM.favoriteMovies = moviesVM.favoriteMovies.addId(movieId)
        }
        moviesVM.userRepository.saveFavoritesUserInfo(moviesVM.favoriteMovies)
        moviesTableView.reloadData()
    }
    
}
