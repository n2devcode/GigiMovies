//
//  UserRepositoryTests.swift
//  GigiMoviesTests
//
//  Created by Anna on 10/06/2021.
//

import XCTest
@testable import GigiMovies

class UserRepositoryTests: XCTestCase {
    let userID = "AnnaTests"
    let userRepository = UserRepository()

    override func setUpWithError() throws {
        userRepository.saveFavoritesUserInfo(forUserID: userID, favorites: "Peliculas")
    }

    override func tearDownWithError() throws {
        userRepository.removeUserInfo(forUserID: userID)
    }

    func testIsConnectedToNetwork() {
        let favorites = userRepository.getFavoritesUserInfo(forUserID: userID)
        XCTAssertEqual(favorites, "Peliculas")
    }

}
