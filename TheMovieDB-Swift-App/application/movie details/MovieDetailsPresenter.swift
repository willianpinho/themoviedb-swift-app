//
//  MovieDetailsPresenter.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import Foundation

protocol MovieDetailsView: NSObjectProtocol {
    func showLoading()
    func hideLoading()
    func reloadTableView()
    func showAlert(title: String, message: String)
    func setupMovie(movie: Movie?)
    func setupVideos(videos: [Video]?)
}

class MovieDetailsPresenter: NSObject {
    var view: MovieDetailsView?
    
    func setViewDelegate(view: MovieDetailsView) {
        self.view = view
    }
    
    func loadMovie(movie: Movie) {
        MovieService.getMovie(movie: movie) { (success, message, movie) in
            if success {
                self.view?.showLoading()
                self.view?.setupMovie(movie: movie!)
                self.view?.reloadTableView()
            } else {
                self.view?.showLoading()
                self.view?.showAlert(title: "Error", message: message!)
            }
            
            self.view?.hideLoading()
            
        }    
    }
    
    func loadVideos(movie: Movie) {
        MovieService.getVideos(movie: movie) { (success, message, videos) in
            if success {
                self.view?.showLoading()
                self.view?.setupVideos(videos: videos!)
                self.view?.reloadTableView()
            } else {
                self.view?.showLoading()
                self.view?.showAlert(title: "Error", message: message!)
            }
            
            self.view?.hideLoading()
        }
    }
}
