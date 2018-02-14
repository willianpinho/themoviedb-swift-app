//
//  UIViewController+Extension.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 09/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setNavigation(title: String, withTintColor tintColor: UIColor, barTintColor: UIColor, andAttributes attributes: [NSAttributedStringKey : Any], prefersLargeTitles: Bool, blurNavigation: Bool) {
        let navigationBar = navigationController!.navigationBar
        
        navigationBar.tintColor = tintColor
        navigationBar.titleTextAttributes = attributes
        navigationBar.barTintColor = barTintColor
        navigationBar.prefersLargeTitles = prefersLargeTitles
        navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: tintColor]
        if blurNavigation == true {
            self.blurNavigation()
        }
        
        self.title = title
    }
    
    func removeBackButtonTitle() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    
    func blurNavigation() {
        let visualEffectView   = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.addSubview(visualEffectView)
    }
    
    func removeNavBarLine(){
        let navigationBar = navigationController!.navigationBar
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
    }
    
    func setNavigationShadow(){
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationController?.navigationBar.layer.shadowOffset = .zero
        navigationController?.navigationBar.layer.shadowRadius = 5
        navigationController?.navigationBar.layer.shadowOpacity = 0.2
    }
    
    func removeNavigationShadow(){
        navigationController?.navigationBar.layer.shadowRadius = 0
        navigationController?.navigationBar.layer.shadowOpacity = 0
    }
    
    func viewControllerIsDark(isDark: Bool) {
        if isDark {
            UIApplication.shared.statusBarStyle = .lightContent
            setNeedsStatusBarAppearanceUpdate()
        } else {
            UIApplication.shared.statusBarStyle = .default
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    func openRootViewController(storyBoard: String) {
        let storyboard = UIStoryboard(name: storyBoard, bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        self.navigationController?.pushViewController(vc!, animated: false)
    }
}
