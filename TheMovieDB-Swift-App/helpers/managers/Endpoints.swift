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
    static let baseUrlImage = "https://image.tmdb.org/t/p"
    static let baseUrlYouTubeVideo = "https://www.youtube.com"
    static let baseUrlThumbYouTubeVideo = "https://img.youtube.com/vi"

    static let baseUrlVimeo = "https://vimeo.com"


    static func createUrl(path: String) -> String {
        return "\(API.baseUrl)\(path)"
    }
    
    static func createUrlImage(path: String) -> String {
        return "\(API.baseUrlImage)\(path)"
    }
    
    static func createUrlYouTubeVideo(path: String) -> String {
        return "\(API.baseUrlYouTubeVideo)\(path)"
    }
    
    static func createUrlThumbYouTubeVideo(key: String) -> String {
        return "\(API.baseUrlThumbYouTubeVideo)/\(key)/hqdefault.jpg"
    }
    
    static func createUrlVimeoVideo(path: String) -> String {
        return "\(API.baseUrlVimeo)\(path)"
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
    
    enum Images: Endpoint {
        case image300
        case image500
        case image780
        case original

        public var path: String {
            switch self {
            case .image300: return "/w300"
            case .image500: return "/w500"
            case .image780: return "/w780"
            case .original: return "/original"
            }
        }
        
        public var url: String {
            switch self {
            case .image300: return API.createUrlImage(path: Endpoints.Images.image300.path)
            case .image500: return API.createUrlImage(path: Endpoints.Images.image500.path)
            case .image780: return API.createUrlImage(path: Endpoints.Images.image780.path)
            case .original: return API.createUrlImage(path: Endpoints.Images.original.path)
            }
        }
        
        
    }
    
    enum Genres: Endpoint {
        case root
        
        public var path: String {
            switch self {
            case .root: return "/genre/movie/list"
            }
        }
        
        public var url: String {
            switch self {
            case .root: return API.createUrl(path: Endpoints.Genres.root.path)
            }
        }
    }
    
    enum Video: Endpoint {
        case youtube
        case vimeo

        
        public var path: String {
            switch self {
            case .youtube: return "/watch?v="
            case .vimeo: return "/"
            }
        }
        
        public var url: String {
            switch self {
            case .youtube: return API.createUrlYouTubeVideo(path: Endpoints.Video.youtube.path)
            case .vimeo: return API.createUrlVimeoVideo(path: Endpoints.Video.vimeo.path)
            }
        }
    }
    

}
