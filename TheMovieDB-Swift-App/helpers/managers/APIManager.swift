//
//  APIManager.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 09/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    
    static let shared = APIManager()
    
    private let manager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = APIConstants.kTimeOutPeriod
        configuration.timeoutIntervalForResource = APIConstants.kTimeOutPeriod
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    static func getRequest(forUrl url: String, withParameters parameters: [String : Any]? = nil, inBody:Bool=false, haveHeader: Bool? = nil, completion: @escaping (_ success: Bool, _ message: String?, _ response: Dictionary<String, AnyObject>?) -> Void) {
                
        var enconding:ParameterEncoding = URLEncoding.default
        
        if inBody {
            enconding = JSONEncoding.default
        }
        var parametersWithKey = Parameters()

        if let parameters = parameters {
            parametersWithKey = parameters
        }
       
        parametersWithKey["api_key"] = "1f54bd990f1cdfb230adb312546d765d"
        
        self.request(url, forMethod: .get, withParameters: parametersWithKey, withEncoding: enconding) { (success, message, response) in
            completion(success,message,response)
        }
    }
    
    private static func request(_ url: String, forMethod method: HTTPMethod, withParameters parameters: [String : Any]? = nil, withEncoding encoding:ParameterEncoding=URLEncoding.default, withHeaders headers: [String : String]? = nil, completion: @escaping (_ success: Bool, _ message: String?, _ response: Dictionary<String, AnyObject>?) -> Void) {
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response: DataResponse<Any>) in
            switch  response.result {
                
            case .success:
                
                let data = response.result.value as! Dictionary<String, AnyObject>
                
                switch response.response!.statusCode {
                    
                case 200:
                    completion(true,nil,data)
                default:
                    
                    completion(false, APIConstants.kMessageServerUnavailable,nil)
                }
                
            case .failure(_):
                
                completion(false,APIConstants.kMessageNetworkError,nil)
            }
        }
    }
}
