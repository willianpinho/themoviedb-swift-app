//
//  DBManager.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

struct DBManager {
    
    static func addObjc(_ obj: Object){
        try! Realm().write(){
            try! Realm().add(obj)
        }
    }
    
    static func getByCondition <T: Object>(param: String, value: String) -> T {
        
        let obj: Results<T> = {
            try! Realm().objects(T.self).filter("\(param) == %@", value)
        }()
        
        if obj.isEmpty {
            return T()
        } else {
            return obj.first!
        }
    }
    
    static func getByPrimaryKey <T: Object>(value: Int) -> T {
        
        let obj: T? = {
            try! Realm().object(ofType: T.self, forPrimaryKey: value)
        }()
        
        if obj == nil  {
            return T()
        } else {
            return obj!
        }
    }
    
    static func getAll<T : Object>() -> [T] {
        let objs: Results<T> = {
            try! Realm().objects(T.self)
        }()
        
        return Array(objs)
    }
    
    static func deleteObjc(_ obj: Object){
        try! Realm().write(){
            try! Realm().delete(obj)
        }
    }
    
    static func deleteAllDatas() {
        try! Realm().write(){
            try! Realm().deleteAll()
        }
    }
    
    static func update(_ obj: Object){
        
        try! Realm().write(){
            try! Realm().add(obj, update: true)
        }
    }
}
