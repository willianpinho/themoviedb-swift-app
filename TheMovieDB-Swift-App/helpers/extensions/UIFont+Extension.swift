//
//  UIFont+Extension.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 09/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func openSansBold(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-Bold", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansBoldItalic(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-BoldItalic", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansExtraBold(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-ExtraBold", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansExtraBoldItalic(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-ExtraBoldItalic", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansItalic(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-Italic", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansLight(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-Light", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansLightItalic(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-LightItalic", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSans(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-Regular", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansSemiBold(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-Semibold", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }
    
    class func openSansSemiboldItalic(withSize size: Int) -> UIFont {
        guard let font = UIFont(name: "OpenSans-SemiboldItalic", size: CGFloat(size)) else {
            return UIFont(name: "OpenSans", size: CGFloat(size))!
        }
        return font
    }  
}
