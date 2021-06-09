//
//  MovieListViewModel.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation

class MovieListViewModel {
    
}

// MARK: getData
extension MovieListViewModel {
    
    func getData(page: Int = 1,
                 success succeed: (@escaping () -> Void),
                 loadError fail: (@escaping () -> Void)) {
        let dataSource = MovieListDataSource()
        dataSource.getResponse(page: page, success: { (result) in
            succeed()
        }, failure: {
            fail()
        })
    }
    
}
