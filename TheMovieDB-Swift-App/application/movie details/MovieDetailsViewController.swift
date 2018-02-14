//
//  MovieDetailsViewController.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit
import PKHUD
import SafariServices

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cells: [UITableViewCell] = []
    var presenter = MovieDetailsPresenter()
    var movie: Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setPresenterDelegate()
        self.customLayout()
        self.setupTableView(tableView: self.tableView)
        self.presenter.loadMovie(movie: movie)
    }
    
    func setPresenterDelegate() {
        presenter.setViewDelegate(view: self)
    }
    
    func customLayout() {        
        if let title = movie.title {
            self.setNavigation(title: title, withTintColor: .white, barTintColor: .black, andAttributes: [NSAttributedStringKey.font: UIFont.openSansLight(withSize: 24), NSAttributedStringKey.foregroundColor: UIColor.white], prefersLargeTitles: false, blurNavigation: true)
            self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        }
    }
}

extension MovieDetailsViewController: MovieDetailsView {
    func setupVideos(videos: [Video]?) {
        if let videos = videos {
            if videos.count > 0 {
                if let tmdtvc = self.tableView.dequeueReusableCell(withIdentifier: "TitleMovieDetailsTableViewCell") as? TitleMovieDetailsTableViewCell {
                    let cell = TitleMovieDetailsTableViewCell.loadData(cell: tmdtvc, title: "Trailers")
                    self.addCellInTableView(cell: cell!)
                }
                
                let youTubeVideos = videos.filter { $0.site == "YouTube" }
                
                for ytv in youTubeVideos {
                    if let vmdtvc = self.tableView.dequeueReusableCell(withIdentifier: "VideosMovieDetailsTableViewCell") as? VideosMovieDetailsTableViewCell {
                        vmdtvc.video = ytv
                        let cell = VideosMovieDetailsTableViewCell.loadData(cell: vmdtvc, video: ytv)
                        self.addCellInTableView(cell: cell!)
                    }
                }
            }
        }
    }
    
    func setupMovie(movie: Movie?) {
        if let movie = movie {
            
            if let hmdtvc = self.tableView.dequeueReusableCell(withIdentifier: "HeaderMovieDetailsTableViewCell") as? HeaderMovieDetailsTableViewCell {
                let cell = HeaderMovieDetailsTableViewCell.loadData(cell: hmdtvc, movie: movie)
                self.addCellInTableView(cell: cell!)
            }
            
            if let tmdtvc = self.tableView.dequeueReusableCell(withIdentifier: "TaglineMovieDetailsTableViewCell") as? TaglineMovieDetailsTableViewCell {
                let cell = TaglineMovieDetailsTableViewCell.loadData(cell: tmdtvc, movie: movie)
                self.addCellInTableView(cell: cell!)
            }
            
            if let ovdtvc = self.tableView.dequeueReusableCell(withIdentifier: "OverviewMovieDetailsTableViewCell") as? OverviewMovieDetailsTableViewCell {
                let cell = OverviewMovieDetailsTableViewCell.loadData(cell: ovdtvc, movie: movie)
                self.addCellInTableView(cell: cell!)
            }
            
            if let tmdtvc = self.tableView.dequeueReusableCell(withIdentifier: "TitleMovieDetailsTableViewCell") as? TitleMovieDetailsTableViewCell {
                let cell = TitleMovieDetailsTableViewCell.loadData(cell: tmdtvc, title: "More Informations")
                self.addCellInTableView(cell: cell!)
            }
            
            
            if let status = movie.status {
                if let imdtvc = self.tableView.dequeueReusableCell(withIdentifier: "InformationsMovieDetailTableViewCell") as? InformationsMovieDetailTableViewCell {
                    let cell = InformationsMovieDetailTableViewCell.loadData(cell: imdtvc, title: "Status", value: status)
                    self.addCellInTableView(cell: cell!)
                }
            }
            
            if let imdtvc = self.tableView.dequeueReusableCell(withIdentifier: "InformationsMovieDetailTableViewCell") as? InformationsMovieDetailTableViewCell {
                let cell = InformationsMovieDetailTableViewCell.loadData(cell: imdtvc, title: "Budget", value: String(format: "US$ %.2f", Double(movie.budget/100)))
                self.addCellInTableView(cell: cell!)
            }
            
            if let originalTitle = movie.originalTitle {
                if let imdtvc = self.tableView.dequeueReusableCell(withIdentifier: "InformationsMovieDetailTableViewCell") as? InformationsMovieDetailTableViewCell {
                    let cell = InformationsMovieDetailTableViewCell.loadData(cell: imdtvc, title: "Original Title", value: originalTitle)
                    self.addCellInTableView(cell: cell!)
                }
            }
            
            if let imdtvc = self.tableView.dequeueReusableCell(withIdentifier: "InformationsMovieDetailTableViewCell") as? InformationsMovieDetailTableViewCell {
                let cell = InformationsMovieDetailTableViewCell.loadData(cell: imdtvc, title: "Duration", value: String(format: "%.1f hour", Double(movie.runtime) / 60.0))
                self.addCellInTableView(cell: cell!)
            }
            
            self.presenter.loadVideos(movie: movie)

        }
        
    }
    
    func addCellInTableView(cell: UITableViewCell) {
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


extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibs([
            MovieListTableViewCell.self,
            HeaderMovieDetailsTableViewCell.self,
            OverviewMovieDetailsTableViewCell.self,
            TaglineMovieDetailsTableViewCell.self,
            VideosMovieDetailsTableViewCell.self,
            InformationsMovieDetailTableViewCell.self,
            TitleMovieDetailsTableViewCell.self
            ])
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = UITableViewAutomaticDimension
        addBackgroundInTableView(tableView: tableView)
        
    }
    
    func addBackgroundInTableView(tableView: UITableView) {
        if let posterPath = self.movie.posterPath {
            if let urlString = Images.generateImageUrl(path: posterPath, 0) {
                let url = URL(string: urlString)
                let bgImage = UIImageView()
                bgImage.kf.setImage(with: url)
                bgImage.contentMode = .scaleAspectFill
                tableView.backgroundView = bgImage
            }
        }
        
        tableView.tableFooterView = UIView(frame: .zero)
        
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
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 0, alpha: 0.5)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if cells[indexPath.row] .isKind(of: VideosMovieDetailsTableViewCell.self) {
            if let cell = cells[indexPath.row] as? VideosMovieDetailsTableViewCell {
                if let video = cell.video {
                    
                    if !(NetworkReachability.isReachable()) {
                        self.present(Alert.showMessage(title: "Error", message: "No Connection :("), animated: true, completion: nil)
                    } else {
                        if let url = URL(string: Endpoints.Video.youtube.url + "\(video.key)") {
                            let svc = SFSafariViewController(url: url)
                            svc.delegate = self
                            self.present(svc, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    }
}

extension MovieDetailsViewController: SFSafariViewControllerDelegate {
}
