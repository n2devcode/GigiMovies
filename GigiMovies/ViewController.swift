//
//  ViewController.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var buttonAll: UIButton!
    @IBOutlet weak var tabAllView: UIView!
    @IBOutlet weak var buttonFavorites: UIButton!
    @IBOutlet weak var tabFavoritesView: UIView!
    @IBOutlet weak var moviesView: UIView!
    
    let moviesVM = MovieListViewModel()
    
    var movieSearch = ""
    
    @IBAction func clickAll(_ sender: Any) {
        movieSearch = ""
        loadData()
    }
    
    @IBAction func clickFavorites(_ sender: Any) {
        loadFavoritesMoviesView()
    }
    
    override func loadData() {
        setAlphaTabs(all: true)
        if Utils.isConnectedToNetwork() {
            showLoadView(moviesView)
            moviesVM.getData {
                self.showAllMoviesView()
            } loadError: {
                self.showErrorView(self.moviesView)
            }
        } else {
            Utils.showAlert(self, description: "No tienes conexión a internet")
            showErrorView(moviesView)
        }
    }
    
    override func showLoadView(_ view: UIView) {
        if let subview = self.loadView("LoadView") as? LoadView {
            self.addSubview(view: view, subview: subview)
        }
    }
    
    override func showErrorView(_ view: UIView) {
        if let subview = self.loadView("ErrorView") as? ErrorView {
            subview.moviesVC = self
            self.addSubview(view: view, subview: subview)
        }
    }
    
    private func showAllMoviesView() {
        if let subview = self.loadView("MovieView") as? MovieView {
            subview.moviesVC = self
            self.addSubview(view: moviesView, subview: subview)
        }
    }
    
    private func setAlphaTabs(all: Bool) {
        buttonAll.alpha = all ? 1 : Constants.alphaTab
        tabAllView.alpha = all ? 1 : Constants.alphaTab
        buttonFavorites.alpha = all ? Constants.alphaTab : 1
        tabFavoritesView.alpha = all ? Constants.alphaTab : 1
    }
    
    private func loadFavoritesMoviesView() {
        setAlphaTabs(all: false)
        if Utils.isConnectedToNetwork() {
            showLoadView(moviesView)
            
            moviesVM.getDataFavorites() {
                if self.moviesVM.favoriteMovieListVM.isEmpty {
                    self.loadEmptyView(self.moviesView, text: "No tienes favoritas aún")
                } else {
                    self.showFavoritesMoviesView()
                }
            }
        } else {
            Utils.showAlert(self, description: "No tienes conexión a internet")
            showErrorView(moviesView)
        }
    }
    
    func loadEmptyView(_ view: UIView, text: String) {
        if let subview = self.loadView("EmptyView") as? EmptyView {
            subview.emptyLabel.text = text
            self.addSubview(view: view, subview: subview)
        }
    }
    
    private func showFavoritesMoviesView() {
        if let subview = self.loadView("MovieTableView") as? MovieTableView {
            subview.isFavoriteView = true
            subview.moviesVC = self
            self.addSubview(view: moviesView, subview: subview)
        }
    }
}

