//
//  MovieViewModel.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation
import UIKit

class MovieViewModel {
    private var movieModel: MovieModel?
    
    var movieId: Int {
        return movieModel?.id ?? Constants.noInt
    }
    
    var title: String {
        return movieModel?.title ?? Constants.noData
    }
    
    var description: String {
        return movieModel?.overview ?? Constants.noData
    }
    
    var imageURLString: String {
        let path = movieModel?.poster_path ?? Constants.noData
        return "\(Constants.baseURLImage)\(path)"
    }
    
    var voteAverage: String {
        let average = movieModel?.vote_average ?? Constants.noDouble
        return "Punt.: \(average)"
    }
    
    init() { }
    
    private init(model: MovieModel) {
        movieModel = model
    }
    
    func getMovie(_ result: MovieModel) -> MovieViewModel {
        return MovieViewModel(model: result)
    }
}
