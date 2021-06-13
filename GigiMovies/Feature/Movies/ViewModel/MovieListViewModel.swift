//
//  MovieListViewModel.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation

class MovieListViewModel {
    let userRepository = UserRepository()
    
    private var movieListModel: MovieListModel?
    
    var movieListVM = [MovieViewModel]()
    private func appendMovieList() {
        let movieVM = MovieViewModel()
        for movieModel in (movieListModel?.results ?? []) {
            let movie = movieVM.getMovie(movieModel)
            movieListVM.append(movie)
        }
    }
    var favoriteMovies = ""
    var favoriteMovieListVM = [MovieViewModel]()
    
    var page: Int {
        return movieListModel?.page ?? Constants.noInt
    }
    
    var totalPages: Int {
        return movieListModel?.total_pages ?? Constants.noInt
    }
    
    var totalResults: Int {
        return movieListModel?.total_results ?? Constants.noInt
    }
    
    func setMovieListModel(_ model: MovieListModel) {
        movieListModel = model
        appendMovieList()
    }
    
    func setFavoriteMovieModel(_ models: [MovieModel]) {
        let movieVM = MovieViewModel()
        for movieModel in models {
            let movie = movieVM.getMovie(movieModel)
            favoriteMovieListVM.append(movie)
        }
    }
}

// MARK: getData
extension MovieListViewModel {
    
    func getData(page: Int = 1,
                 success succeed: (@escaping () -> Void),
                 loadError fail: (@escaping () -> Void)) {
        let dataSource = MovieListDataSource()
        dataSource.getResponse(page: page, success: { (result) in
            if page == 1 {
                self.movieListVM = [MovieViewModel]()
            }
            self.setMovieListModel(result)
            succeed()
        }, failure: {
            fail()
        })
    }
    
    func getDataSearch(page: Int = 1,
                       title: String,
                       success succeed: (@escaping () -> Void),
                       loadError fail: (@escaping () -> Void)) {
        let dataSource = MovieListSearchDataSource()
        dataSource.getResponse(page: page, title: title, success: { (result) in
            if page == 1 {
                self.movieListVM = [MovieViewModel]()
            }
            self.setMovieListModel(result)
            succeed()
        }, failure: {
            fail()
        })
    }
    
    func getDataFavorites(success succeed: (@escaping () -> Void)) {
        favoriteMovies = userRepository.getFavoritesUserInfo()
        if favoriteMovies.isEmpty {
            self.favoriteMovieListVM = [MovieViewModel]()
            succeed()
            return
        }
        
        let dataSource = MovieListFavoriteDataSource()
        dataSource.getResponse(ids: favoriteMovies, success: { (result) in
            self.favoriteMovieListVM = [MovieViewModel]()
            self.setFavoriteMovieModel(result)
            succeed()
        })
    }
    
}
