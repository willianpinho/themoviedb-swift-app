//
//  UpcomingListViewController.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 09/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit
import PKHUD

class UpcomingListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter = UpcomingListPresenter()
    var currentPage:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPresenterDelegate()
        self.customLayout()
        self.presenter.loadMovieList(page: currentPage)
    }
    
    func setPresenterDelegate() {
        presenter.setViewDelegate(view: self)
    }
    
    func customLayout() {
        self.removeNavBarLine()
        self.setNavigation(title: "Upcoming Movies", withTintColor: .black, barTintColor: .white, andAttributes: [NSAttributedStringKey.font: UIFont.openSansLight(withSize: 24), NSAttributedStringKey.foregroundColor: UIColor.black], prefersLargeTitles: true)
    }
}

extension UpcomingListViewController: UpcomingListView {
    func setupMoviesList(movies: [Movie]?) {
        
    }
    
    func showLoading() {
        PKHUD.sharedHUD.show()
    }
    
    func hideLoading() {
        PKHUD.sharedHUD.hide()
    }
    
    func reloadTableView() {
//        self.tableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = Alert.showMessage(title: title, message: message)
        self.present(alert, animated: true, completion: nil)
    }
}
