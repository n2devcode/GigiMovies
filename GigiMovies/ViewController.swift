//
//  ViewController.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var buttonAll: UIButton!
    @IBOutlet weak var buttonFavorites: UIButton!
    @IBOutlet weak var moviesView: UIView!
    
    @IBAction func clickAll(_ sender: Any) {
        loadData()
    }
    
    @IBAction func clickFavorites(_ sender: Any) {
        showFavoritesMoviesView()
    }
    
    override func loadData() {
        showLoadView()
//        moviesVM.getData {
//            self.showAllMoviesView()
//        } loadError: {
//            self.showErrorView()
//        }
    }
    
    override func showLoadView() {
        if let subview = self.loadView("LoadView") as? LoadView {
            self.addSubview(view: moviesView, subview: subview)
        }
    }
    
    override func showErrorView() {
        if let subview = self.loadView("ErrorView") as? ErrorView {
            subview.moviesVC = self
            self.addSubview(view: moviesView, subview: subview)
        }
    }
    
    private func showAllMoviesView() {
        
    }
    
    private func showFavoritesMoviesView() {
        
    }
}

