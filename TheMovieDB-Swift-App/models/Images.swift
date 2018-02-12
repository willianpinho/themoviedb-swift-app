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
    
}

