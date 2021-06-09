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
    
    @IBAction func clickFavorite(_ sender: Any) {
    }
    
}
