//
//  MovieListDataSource.swift
//  GigiMovies
//
//  Created by Anna on 09/06/2021.
//

import Foundation
import Alamofire

class MovieListDataSource: NSObject {
    
    func getResponse(page: Int = 1,
                     success succeed: (@escaping (MovieListModel) -> Void),
                     failure fail: (@escaping () -> Void)) {
        
        let url = "\(Constants.baseURL)/movie/popular"
        
        let parameters: [String: Any] = [
            "api_key": Constants.apiKey,
            "language": "es-ES",
            "page": page
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
