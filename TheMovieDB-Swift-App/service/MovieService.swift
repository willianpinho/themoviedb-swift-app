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
import RealmSwift
import RealmAdditions

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
                if !(NetworkReachability.isReachable()) {
                    let movies: [Movie] = DBManager.getAll()
                    completion(true, "Offline movies", movies)
                }
                completion(false, message, nil)
            }
        }
        
        
    }
    
    static func getLocalMovies(page: Int?, completion: @escaping (_ success: Bool, _ message: String?, _ response: [Movie]?) -> Void) {
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
    
    static func getMovie(movie: Movie, completion: @escaping (_ success: Bool, _ message: String?, _ response: Movie?) -> Void) {
        APIManager.getRequest(forUrl: Endpoints.Movies.root.url + "/\(movie.id)") { (success, message, response) in
            if success {
                let json = JSON(response!)
                let movie = Mapper<Movie>().map(JSONString: json.rawString()!)
                if let movie = movie {
                    DBManager.update(movie)
                }
                completion(true, message, movie)
            } else {
                completion(false, message, nil)
            }
        }
    }
    
    static func getVideos(movie: Movie, completion: @escaping (_ success: Bool, _ message: String?, _ response: [Video]?) -> Void) {
        
        APIManager.getRequest(forUrl: Endpoints.Movies.root.url + "/\(movie.id)" + "/videos") { (success, message, response) in
            if success {
                let json = JSON(response!["results"] as Any)
                let videos = Mapper<Video>().mapArray(JSONString: json.rawString()!)
                if let videos = videos {
                    let tempVideos = List<Video>()
                    for v in videos {
                        tempVideos.append(v)
                    }
                    movie.videos = tempVideos
                }
                
                DBManager.update(movie)
                
                completion(true, message, videos)
            } else {
                completion(false, message, nil)
            }
        }
    }
    
}
