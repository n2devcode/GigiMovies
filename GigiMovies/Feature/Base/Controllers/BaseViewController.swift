//
//  BaseViewController.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class BaseViewController: UIViewController, LoadViewProtocol, AddSubviewConstraintsProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func loadData() {}
    func showLoadView() {}
    func showErrorView() {}
}
