//
//  ViewController.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var buttonAll: UIButton!
    @IBOutlet weak var buttonFavorites: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllMovies()
    }

    @IBAction func clickAll(_ sender: Any) {
        loadAllMovies()
    }
    
    @IBAction func clickFavorites(_ sender: Any) {
    }
    
    private func loadAllMovies() {
        
    }
}

