//
//  UITableView+Extension.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNibFrom(_ cellClass: UITableViewCell.Type) {
        let nib = UINib(nibName: cellClass.className(), bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellClass.className())
    }
    
    func registerNibs(_ cellClasses : [UITableViewCell.Type]) {
        cellClasses.forEach { self.registerNibFrom($0) }
    }
    
    func dequeueReusableCell<T : UITableViewCell>(ofType type: T.Type) -> T? {
        return self.dequeueReusableCell(withIdentifier: type.className()) as? T
    }
    
    func dequeueReusableCell<T : UITableViewCell>(ofType type: T.Type, forIndexPath indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: type.className(), for: indexPath) as? T
    }
    
    func bounceOnlyOnBottom(_ scrollView: UIScrollView) {
        if scrollView == self {
            if self.contentOffset.y <= 0 {
                self.contentOffset = CGPoint.zero
            }
        }
    }
}
