//
//  String+ExtensionTests.swift
//  GigiMoviesTests
//
//  Created by Anna on 10/06/2021.
//

import XCTest

class StringExtensionTests: XCTestCase {
    var list = ""

    override func setUpWithError() throws {
        list = "11,22,44,66,33,99"
    }

    override func tearDownWithError() throws {
        list = ""
    }

    func testAddId() {
        list = list.addId(88)
        XCTAssertEqual(list, "11,22,44,66,33,99,88")
    }
    
    func testRemoveId() {
        list = list.removeId(66)
        XCTAssertEqual(list, "11,22,44,33,99")
        list = list.removeId(99)
        XCTAssertEqual(list, "11,22,44,33")
        list = list.removeId(11)
        XCTAssertEqual(list, "22,44,33")
    }
    
    func testContainsId() {
        XCTAssertTrue(list.contains("33"))
    }

}
