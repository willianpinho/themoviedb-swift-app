//
//  ClassName.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation

extension NSObject {
    class func className() -> String {
        return String(describing: self)
    }
}

