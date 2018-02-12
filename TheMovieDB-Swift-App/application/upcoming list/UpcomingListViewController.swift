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
    var cells: [MovieListTableViewCell] = []
    var presenter = UpcomingListPresenter()
    var currentPage:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPresenterDelegate()
        self.customLayout()
        self.setupTableView(tableView: self.tableView)
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
        if let movies = movies {
            for movie in movies {
                if let mtvc = self.tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as? MovieListTableViewCell {
                    let cell = MovieListTableViewCell.loadData(cell: mtvc, movie: movie)
                    self.addCellInTableView(cell: cell!)
                }
            }
        }
    }
    
    func addCellInTableView(cell: MovieListTableViewCell) {
        self.cells.append(cell)
        tableView.reloadData()
    }
    
    func showLoading() {
        PKHUD.sharedHUD.show()
    }
    
    func hideLoading() {
        PKHUD.sharedHUD.hide()
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
    
    func showAlert(title: String, message: String) {
        let alert = Alert.showMessage(title: title, message: message)
        self.present(alert, animated: true, completion: nil)
    }
}

extension UpcomingListViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibs([
            MovieListTableViewCell.self
            ])
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cells[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard(name: "AdDetail", bundle: nil)
//        if let vc = storyboard.instantiateInitialViewController() as? AdDetailViewController {
//            vc.ad = ads[indexPath.row]
//            self.navigationController?.pushViewController(vc, animated: false)
//        }
    }
}
