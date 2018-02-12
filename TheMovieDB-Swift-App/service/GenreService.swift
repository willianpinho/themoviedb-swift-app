//
//  GenreService.swift
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

class GenreService {
    static func getAllGenres(completion: @escaping (_ success: Bool, _ message: String?, _ response: [Genre]?) -> Void) {
        APIManager.getRequest(forUrl: Endpoints.Genres.root.url) { (success, message, response) in
            if success {
                let json = JSON(response!["genres"] as Any)
                let genres = Mapper<Genre>().mapArray(JSONObject: json.arrayObject)
                completion(true, message, genres)
            } else {
                completion(false, message, nil)
            }
        }
    }
}
