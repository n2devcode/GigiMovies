//
//  UtilsTests.swift
//  GigiMoviesTests
//
//  Created by Anna on 09/06/2021.
//

import XCTest
@testable import GigiMovies

class UtilsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsConnectedToNetwork() {
        XCTAssertTrue(Utils.isConnectedToNetwork(), "isConnectedToNetwork returned false")
    }

}
