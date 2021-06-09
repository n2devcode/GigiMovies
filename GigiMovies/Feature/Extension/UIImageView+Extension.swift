//
//  UIImageView+Extension.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation
import UIKit
import SDWebImage

extension UIImageView {
    
    public func loadGif() {
        DispatchQueue.global().async {
            let image = UIImage.gif(name: "load")
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
    public func loadImage(stringURL: String) {
        if stringURL == "\(Constants.baseURLImage)\(Constants.noData)" {
            self.image = UIImage(named: "noImage")
        } else {
            if let url = URL(string: stringURL) {
                DispatchQueue.main.async {
                    let imageLoad = UIImage(named: "loadingImage")
                    self.sd_setImage(with: url, placeholderImage: imageLoad)
                }
            } else {
                self.image = UIImage(named: "error_carga")
            }
        }
    }
    
}
