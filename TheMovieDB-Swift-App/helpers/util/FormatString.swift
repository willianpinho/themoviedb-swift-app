//
//  FormatString.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation

class FormatString {
    static func convertDateToString(date: Date) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        return formatter.string(from: date)
    }
}
