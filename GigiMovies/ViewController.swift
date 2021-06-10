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
    let userRepository = UserRepository()
    
    var movieSearch = ""
    var favoriteMovies = ""
    
    @IBAction func clickAll(_ sender: Any) {
        movieSearch = ""
        loadData()
    }
    
    @IBAction func clickFavorites(_ sender: Any) {
        showFavoritesMoviesView()
    }
    
    override func loadData() {
        favoriteMovies = userRepository.getFavoritesUserInfo()
        
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
    
    private func showFavoritesMoviesView() {
        setAlphaTabs(all: false)
        loadEmptyView(moviesView, text: "No tienes favoritas aún")
    }
    
    func loadEmptyView(_ view: UIView, text: String) {
        if let subview = self.loadView("EmptyView") as? EmptyView {
            subview.emptyLabel.text = text
            self.addSubview(view: view, subview: subview)
        }
    }
}

