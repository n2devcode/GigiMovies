//
//  ErrorView.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import UIKit

class ErrorView: UIView {
    
    var moviesVC = BaseViewController()

    @IBAction func clickRetry(_ sender: Any) {
        moviesVC.loadData()
    }
    
}
