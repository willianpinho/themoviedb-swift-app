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

}

class UpcomingListPresenter: NSObject {
    var view: UpcomingListView?

    func setViewDelegate(view: UpcomingListView) {
        self.view = view
    }
}
