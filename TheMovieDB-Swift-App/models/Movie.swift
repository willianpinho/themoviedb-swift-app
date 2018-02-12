//
//  Movie.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 09/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import ObjectMapper
import ObjectMapperAdditions
import RealmSwift
import RealmAdditions

class Movie: Object, Mappable {
    var voteCount: Int?
    var id: Int?
    var video: Bool?
    var voteAverage: Double?
    var title: String?
    var popularity: Double?
    var posterPath: String?
    var originalLanguage: String?
    var originalTitle: String?
    var genreIds: [Int]?
    var backdropPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: Date?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        voteCount <- map["vote_count"]
        id <- map["id"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        title <- map["title"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        backdropPath <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        releaseDate <- (map["release_date"], CustomDateFormatTransform(formatString: "yyyy-MM-dd"))
    }
    
}
