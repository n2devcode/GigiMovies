//
//  ErrorView.swift
//  Marvel
//
//  Created by Anna on 30/05/2021.
//

import UIKit

class ErrorView: UIView {
    
    var moviesVC = BaseViewController()

    @IBAction func clickRetry(_ sender: Any) {
        moviesVC.loadData()
    }
    
}
