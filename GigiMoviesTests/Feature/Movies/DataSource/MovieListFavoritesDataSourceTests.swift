//
//  MovieListFavoritesDataSourceTests.swift
//  GigiMoviesTests
//
//  Created by Anna on 13/06/2021.
//

import XCTest
@testable import GigiMovies

class MovieListFavoritesDataSourceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResultSuccessDataSource(ids: String, success succeed: (@escaping (Bool, [MovieModel]?) -> Void)) {
        let movieListFavoriteDS = MovieListFavoriteDataSource()
        movieListFavoriteDS.getResponse(ids: ids) { (result) in
            succeed(true, result)
        }
    }
    
    func testGetResponse() {
        let exp = expectation(description: "Alamofire")
        testResultSuccessDataSource(ids: "637649,399566,337404", success: { (result, _) in
            XCTAssertTrue(result, "testResultSuccessDataSource returned false")
            exp.fulfill()
        })
        waitForExpectations(timeout: 5.0, handler: nil)
    }

}
