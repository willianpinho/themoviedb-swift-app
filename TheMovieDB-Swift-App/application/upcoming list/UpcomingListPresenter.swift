//
//  UpcomingListPresenter.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 09/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation

protocol UpcomingListView: NSObjectProtocol {
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlert(title: String, message: String)
    func setupMoviesList(movies: [Movie]?)

}

class UpcomingListPresenter: NSObject {
    var view: UpcomingListView?

    func setViewDelegate(view: UpcomingListView) {
        self.view = view
    }

    func loadMovieList(page: Int?) {
        MovieService.getMovies(page: page) { (success, message, movies) in
            if success {
                self.view?.showLoading()
                self.view?.setupMoviesList(movies: movies!)
                self.view?.reloadTableView()
            } else {
                self.view?.showLoading()
                self.view?.showAlert(title: "Error", message: message!)
            }
            
            self.view?.hideLoading()
        }
    }
}
