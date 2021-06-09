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
        moviesVC.movieSearch = searchTextField.text ?? ""
        
        if Utils.isConnectedToNetwork() {
            loadDataSearch(view: movieTableView)
        } else {
            Utils.showAlert(moviesVC, description: "No tienes conexión a internet")
            moviesVC.showErrorView(moviesVC.moviesView)
        }
    }
    
    private func loadDataSearch(view: UIView) {
        moviesVC.showLoadView(view)
        if moviesVC.movieSearch.isEmpty {
            moviesVC.loadData()
        } else {
            moviesVC.moviesVM.getDataSearch(title: moviesVC.movieSearch) {
                if self.moviesVC.moviesVM.movieListVM.count == 0 {
                    self.moviesVC.loadEmptyView(self.movieTableView, text: "No hay ningún resultado para esta búsqueda")
                } else {
                    self.loadTable()
                }
            } loadError: {
                self.moviesVC.showErrorView(self.moviesVC.moviesView)
            }
        }
    }
    
    private func loadTable() {
        if let subview = self.moviesVC.loadView("MovieTableView") as? MovieTableView {
            subview.moviesVC = moviesVC
            self.moviesVC.addSubview(view: movieTableView, subview: subview)
        }
    }
    
}
