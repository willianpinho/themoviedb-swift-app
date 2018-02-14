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
    @objc dynamic var voteCount: Int = 0
    @objc dynamic var id: Int = 0
    var video = RealmOptional<Bool>()
    var voteAverage = RealmOptional<Double>()
    @objc dynamic var title: String?
    var popularity = RealmOptional<Double>()
    @objc dynamic var posterPath: String?
    @objc dynamic var originalLanguage: String?
    @objc dynamic var originalTitle: String?
    var genreIds: [Int]?
    var genres = List<Genre>()
    @objc dynamic var backdropPath: String?
    var adult = RealmOptional<Bool>()
    @objc dynamic var overview: String?
    @objc dynamic var releaseDate: Date?
    
    @objc dynamic var budget: Int = 0
    @objc dynamic var homepage: String?
    @objc dynamic var imdbId: Int = 0
    var productionCompanies = List<ProductionCompany>()
    @objc dynamic var revenue: Int = 0
    @objc dynamic var runtime: Int = 0
    @objc dynamic var status: String?
    @objc dynamic var tagLine: String?
    
    var videos = List<Video>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        voteCount <- map["vote_count"]
        id <- map["id"]
        video.value <- (map["video"], BoolTransform())
        voteAverage.value <- (map["vote_average"], DoubleTransform())
        title <- map["title"]
        popularity.value <- (map["popularity"], DoubleTransform())
        posterPath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        genres <- (map["genres"], ArrayTransform<Genre>())
        backdropPath <- map["backdrop_path"]
        adult.value <- (map["adult"], BoolTransform())
        overview <- map["overview"]
        releaseDate <- (map["release_date"], CustomDateFormatTransform(formatString: "yyyy-MM-dd"))
        
        budget <- map["budget"]
        homepage <- map["homepage"]
        imdbId <- map["imdb_id"]
        productionCompanies <- (map["production_companies"], ArrayTransform<ProductionCompany>())
        revenue <- map["revenue"]
        runtime <- map["runtime"]
        status <- map["status"]
        tagLine <- map["tagline"]
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
