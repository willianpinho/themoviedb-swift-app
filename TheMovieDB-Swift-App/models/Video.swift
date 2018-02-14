//
//  Video.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import ObjectMapper
import ObjectMapperAdditions
import RealmSwift
import RealmAdditions

class Video : Object, Mappable {
    
    @objc dynamic var id = 0
    @objc dynamic var key: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var site: String = ""

    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        key <- map["key"]
        name <- map["name"]
        site <- map["site"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func generateVideoUrl(_ key: String, _ site: String?) -> String? {
        if let site = site {
            switch site {
            case "YouTube":
                return API.createUrlThumbYouTubeVideo(key: key)
            case "Vimeo":
                return Endpoints.Video.vimeo.url + key
            default:
                return API.createUrlThumbYouTubeVideo(key: key)
            }
        }
        
        return nil
    }
    
}
