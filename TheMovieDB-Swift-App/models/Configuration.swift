//
//  Configuration.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import ObjectMapper
import ObjectMapperAdditions
import RealmSwift
import RealmAdditions

class Configuration: Object, Mappable {
    var images: Images?
    var changeKeys: [String]?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        images <- map["images"]
        changeKeys <- map["change_keys"]
    }
    
}

