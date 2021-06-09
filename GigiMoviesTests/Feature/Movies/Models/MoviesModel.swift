//
//  MoviesModel.swift
//  GigiMoviesTests
//
//  Created by Anna on 09/06/2021.
//

import XCTest
@testable import GigiMovies

class MoviesModel: XCTestCase {
    var model: MovieListModel?
    
    override func setUpWithError() throws {
        guard let path = Bundle(for: GigiMoviesTests.self).path(forResource: "movies", ofType: "json") else {
            fatalError("Can't find search.json file")
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        model = try JSONDecoder().decode(MovieListModel.self, from: data)
    }

    override func tearDownWithError() throws {
        model = nil
    }

    func testMovieListModel() throws {
        XCTAssertEqual(model?.page, 1)
        XCTAssertEqual(model?.results?.count, 20)
        XCTAssertEqual(model?.total_pages, 500)
        XCTAssertEqual(model?.total_results, 10000)
    }
    
    func testMovieModel() throws {
        let movie = model?.results?[0]
        XCTAssertEqual(movie?.id, 337404)
        XCTAssertEqual(movie?.title, "Cruella")
        XCTAssertEqual(movie?.overview, "\"Cruella\" se sumerge en la juventud rebelde de uno de los villanos más conocidos -y más de moda-, nada menos que la legendaria Cruella de Vil. Emma Stone encarna a Estella, alias Cruella, junto a Emma Thompson como la Baronesa, la directora de una prestigiosa firma de moda que convierte a Estella en una incipiente diseñadora. La cinta está ambientada en el contexto del punk-rock londinense de los 70.")
        XCTAssertEqual(movie?.poster_path, "/qb28nkLZV0v6yJZZRpJYl0LE35N.jpg")
        XCTAssertEqual(movie?.vote_average, 8.7)
    }

}
