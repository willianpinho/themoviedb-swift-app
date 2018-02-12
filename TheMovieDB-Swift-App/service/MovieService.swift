//
//  MovieService.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ObjectMapper
import AlamofireObjectMapper

class MovieService {
    static func getMovies(page: Int?, completion: @escaping (_ success: Bool, _ message: String?, _ response: [Movie]?) -> Void) {
        var parameters = Parameters()
        if let page = page {
            parameters["page"] = page
        } else {
            parameters["page"] = 1
        }
        
        APIManager.getRequest(forUrl: Endpoints.Movies.upcoming.url, withParameters: parameters) { (success, message, response) in
            if success {
                let json = JSON(response!["results"] as Any)
                let movies = Mapper<Movie>().mapArray(JSONString: json.rawString()!)
                completion(true, message, movies)
            } else {
                completion(false, message, nil)
            }
        }
    }
}

