//
//  Images.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import ObjectMapper
import ObjectMapperAdditions
import RealmSwift
import RealmAdditions

class Images: Object, Mappable {
    var baseUrl: String?
    var secureBaseUrl: String?
    var backdropSizes: [String]?
    var logoSizes: [String]?
    var posterSizes: [String]?
    var profileSizes: [String]?
    var stillSizes: [String]?

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        baseUrl <- map["base_url"]
        secureBaseUrl <- map["secure_base_url"]
        backdropSizes <- map["backdrop_sizes"]
        logoSizes <- map["logo_sizes"]
        posterSizes <- map["poster_sizes"]
        profileSizes <- map["profile_sizes"]
        stillSizes <- map["still_sizes"]
    }
    
    static func generateImageUrl(path: String, _ size: Int?) -> String? {
        switch size {
        case 300?:
            return Endpoints.Images.image300.url + path
        case 500?:
            return Endpoints.Images.image500.url + path
        case 780?:
            return Endpoints.Images.image780.url + path
        default:
            return Endpoints.Images.original.url + path
        }
    }
    
}

