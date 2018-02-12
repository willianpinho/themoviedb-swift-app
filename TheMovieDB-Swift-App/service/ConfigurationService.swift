//
//  ConfigurationService.swift
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

class ConfigurationService {
    static func getConfiguration(completion: @escaping (_ success: Bool, _ message: String?, _ response: Configuration?) -> Void) {
        
        APIManager.getRequest(forUrl: Endpoints.Configuration.root.url) { (success, message, response) in
            if success {
                let json = JSON(response!)
                let configuration = Mapper<Configuration>().map(JSONString: json.rawString()!)
                completion(true, message, configuration)
            } else {
                completion(false, message, nil)
            }
        }
    }
}
