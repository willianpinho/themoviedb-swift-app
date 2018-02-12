//
//  Endpoints.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.themoviedb.org/3"
    
    static func createUrl(path: String) -> String {
        return "\(API.baseUrl)\(path)"
    }
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
    
}

enum Endpoints {
    
    enum Configuration: Endpoint {
        case root
        
        public var path: String {
            switch self {
            case .root: return "/configuration"
            }
        }
        
        public var url: String {
            switch self {
            case .root: return API.createUrl(path: Endpoints.Configuration.root.path)
            }
        }
    }
    
    enum Movies: Endpoint {
        case root
        case upcoming

        
        public var path: String {
            switch self {
            case .root: return "/movie"
            case .upcoming: return Endpoints.Movies.root.path + "/upcoming"
            }
        }
        
        public var url: String {
            switch self {
            case .root: return API.createUrl(path: Endpoints.Movies.root.path)
            case .upcoming: return API.createUrl(path: Endpoints.Movies.upcoming.path)
            }
        }
    }
}
