//
//  MovieListSearchDataSource.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation
import Alamofire

class MovieListSearchDataSource: NSObject {
    
    func getResponse(page: Int = 1,
                     title: String,
                     success succeed: (@escaping (MovieListModel) -> Void),
                     failure fail: (@escaping () -> Void)) {
        
        let url = "\(Constants.baseURL)/search/movie"
        
        let parameters: [String: Any] = [
            "api_key": Constants.apiKey,
            "language": "es-ES",
            "page": page,
            "query": title
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
            .responseDecodable(of: MovieListModel.self) { (response) in
                
                switch response.result {
                case .success(let value):
                    succeed(value)
                case .failure(_):
                    fail()
                }
            }
    }
    
}
