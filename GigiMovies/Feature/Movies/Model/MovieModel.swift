//
//  MovieModel.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation

struct MovieModel: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let poster_path: String?
    let vote_average: Double?
}
