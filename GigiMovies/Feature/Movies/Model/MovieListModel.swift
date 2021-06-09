//
//  MovieListModel.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation

struct MovieListModel: Codable {
    let page: Int?
    let results: [MovieModel]?
    let total_pages: Int?
    let total_results: Int?
}
