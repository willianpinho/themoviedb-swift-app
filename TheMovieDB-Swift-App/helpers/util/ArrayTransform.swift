//
//  ArrayTransform.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import RealmSwift
import ObjectMapper

class ArrayTransform<T:RealmSwift.Object> : TransformType where T:Mappable {
    typealias Object = List<T>
    typealias JSON = Array<AnyObject>
    
    func transformFromJSON(_ value: Any?) -> List<T>? {
        let result = List<T>()
        if let tempArr = value as! Array<AnyObject>? {
            for entry in tempArr {
                let mapper = Mapper<T>()
                let model : T = mapper.map(JSONObject: entry)!
                result.append(model)
            }
        }
        return result
    }
    
    func transformToJSON(_ value: List<T>?) -> Array<AnyObject>? {
        if (value!.count > 0) {
            var result = Array<T>()
            for entry in value! {
                result.append(entry)
            }
            return result
        }
        return nil
    }
}
