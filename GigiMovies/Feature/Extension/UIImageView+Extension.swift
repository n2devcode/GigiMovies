//
//  UIImageView+Extension.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    public func loadGif() {
        DispatchQueue.global().async {
            let image = UIImage.gif(name: "load")
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
    
}
