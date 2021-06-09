//
//  MovieView.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class MovieView: UIView {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var movieTableView: UIView!
    
    var moviesVC = ViewController() {
        didSet {
            loadTable()
        }
    }
    
    @IBAction func clickSearch(_ sender: Any) {
    }
    
    private func loadTable() {
        if let subview = self.moviesVC.loadView("MovieTableView") as? MovieTableView {
            subview.moviesVC = moviesVC
            self.moviesVC.addSubview(view: movieTableView, subview: subview)
        }
    }
    
}
