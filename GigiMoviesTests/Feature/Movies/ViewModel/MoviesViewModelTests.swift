//
//  MoviesViewModelTests.swift
//  GigiMoviesTests
//
//  Created by Anna on 09/06/2021.
//

import XCTest
@testable import GigiMovies

class MoviesViewModelTests: XCTestCase {
    let movieListVM = MovieListViewModel()
    
    var model: MovieListModel?
    
    override func setUpWithError() throws {
        guard let path = Bundle(for: GigiMoviesTests.self).path(forResource: "movies", ofType: "json") else {
            fatalError("Can't find search.json file")
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        model = try JSONDecoder().decode(MovieListModel.self, from: data)
        
        movieListVM.setMovieListModel(model ?? MovieListModel(page: Constants.noInt, results: [], total_pages: Constants.noInt, total_results: Constants.noInt))
    }

    override func tearDownWithError() throws {
        model = nil
    }

    func testMovieListModel() throws {
        XCTAssertEqual(movieListVM.page, 1)
        XCTAssertEqual(movieListVM.movieListVM.count, 20)
        XCTAssertEqual(movieListVM.totalPages, 500)
        XCTAssertEqual(movieListVM.totalResults, 10000)
    }
    
    func testMovieModel() throws {
        let movie = movieListVM.movieListVM[0]
        XCTAssertEqual(movie.movieId, 337404)
        XCTAssertEqual(movie.title, "Cruella")
        XCTAssertEqual(movie.description, "\"Cruella\" se sumerge en la juventud rebelde de uno de los villanos más conocidos -y más de moda-, nada menos que la legendaria Cruella de Vil. Emma Stone encarna a Estella, alias Cruella, junto a Emma Thompson como la Baronesa, la directora de una prestigiosa firma de moda que convierte a Estella en una incipiente diseñadora. La cinta está ambientada en el contexto del punk-rock londinense de los 70.")
        XCTAssertEqual(movie.imageURLString, "https://image.tmdb.org/t/p/w500/qb28nkLZV0v6yJZZRpJYl0LE35N.jpg")
        XCTAssertEqual(movie.voteAverage, "Punt.: 8.7")
    }

}
