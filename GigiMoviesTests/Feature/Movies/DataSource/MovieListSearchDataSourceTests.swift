//
//  MovieListSearchDataSourceTests.swift
//  GigiMoviesTests
//
//  Created by Anna on 09/06/2021.
//

import XCTest
@testable import GigiMovies

class MovieListSearchDataSourceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testResultSuccessDataSource(page: Int, success succeed: (@escaping (Bool, MovieListModel?) -> Void)) {
        let movieListSearchDS = MovieListSearchDataSource()
        movieListSearchDS.getResponse(page: page, title: "Spider") { (result) in
            succeed(true, result)
        } failure: {
            succeed(false, nil)
        }
    }
    
    func testGetResponse() {
        let exp = expectation(description: "Alamofire")
        testResultSuccessDataSource(page: 1, success: { (result, _) in
            XCTAssertTrue(result, "testResultSuccessDataSource returned false")
            exp.fulfill()
        })
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testGetResponseIteratively() {
        let iterations = 5
        let num = 20
        
        var moviesList = [MovieModel]()
        
        for index in 0..<iterations {
            let page = index+1
            
            let exp = expectation(description: "AlamofireIteratively")
            
            testResultSuccessDataSource(page: page, success: { (result, data) in
                XCTAssertTrue(result, "testResultSuccessDataSource returned false")
                
                XCTAssertEqual(data?.page, page, "returned results not equal to page")
                XCTAssertEqual(data?.results?.count, num, "returned results not equal to num")
                XCTAssertEqual(data?.total_pages, 14, "returned results not equal to 14")
                XCTAssertEqual(data?.total_results, 277, "returned results not equal to 277")
                
                moviesList += data?.results ?? []
                XCTAssertEqual(moviesList.count, page*num, "returned results not equal to page*num")
                
                exp.fulfill()
            })
            
            waitForExpectations(timeout: 5.0, handler: nil)
        }
        
        XCTAssertEqual(moviesList.count, 100, "returned results not equal to 100")
    }

}
