//
//  ApplicationState.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import SwiftyJSON

class ApplicationState {
    static let sharedInstance = ApplicationState()
    let realm = try! Realm()
    var configuration: Configuration?
    
    func getConfiguration() -> Configuration? {
        ConfigurationService.getConfiguration { (success, message, configuration) in
            if success == true {
               self.configuration = configuration
            }
        }
        
        return nil
    }
    
    static func initializeLocalDatabase() {
        self.initializeGenres()
    }
    
    static func initializeGenres() {
        GenreService.getAllGenres { (success, message, genres) in
            if success == true {
                for g in genres! {
                    DBManager.update(g)
                }
            }
        }
    }
}
