//
//  MovieListFavoriteDataSource.swift
//  GigiMovies
//
//  Created by Anna on 13/06/2021.
//

import Foundation
import Alamofire

class MovieListFavoriteDataSource: NSObject {
    
    func getResponse(ids: String,
                     success succeed: (@escaping ([MovieModel]) -> Void)) {
        
        var movies = [MovieModel]()
        
        let arrayIds = ids.components(separatedBy: ",")
        arrayIds.forEach { (stringMovieId) in
            let movieId = Int(stringMovieId) ?? Constants.noInt
            getResponse(id: movieId) { (movieModel) in
                movies.append(movieModel)
                if movies.count == arrayIds.count {
                    succeed(movies)
                }
            } failure: {
                movies.append(
                    MovieModel(
                        id: movieId,
                        title: "Error en la carga de la película",
                        overview: Constants.noData,
                        poster_path: Constants.noData,
                        vote_average: Constants.noDouble
                    )
                )
                if movies.count == arrayIds.count {
                    succeed(movies)
                }
            }

        }
    }
    
    private func getResponse(id: Int,
                             success succeed: (@escaping (MovieModel) -> Void),
                             failure fail: (@escaping () -> Void)) {
        
        let url = "\(Constants.baseURL)/movie/\(id)"
        
        let parameters: [String: Any] = [
            "api_key": Constants.apiKey,
            "language": "es-ES"
        ]
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        
        AF.request(url,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.queryString,
                   headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: MovieModel.self) { (response) in
                
                switch response.result {
                case .success(let value):
                    succeed(value)
                case .failure(_):
                    fail()
                }
            }
    }
    
}
