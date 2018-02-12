//
//  MovieListTableViewCell.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 12/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var voteAverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static func loadData(cell: MovieListTableViewCell, movie: Movie) -> MovieListTableViewCell? {
        if let title = movie.title {
            cell.titleLabel.text = title
        }
        
        if let releaseDate = movie.releaseDate {
            cell.releaseDateLabel.text = FormatString.convertDateToString(date: releaseDate)
        }
        
        if let posterPath = movie.posterPath {
            if let urlString = Images.generateImageUrl(path: posterPath, size: 500) {
                let url = URL(string: urlString)
                cell.posterImage.kf.setImage(with: url)
            }
        }
        
        if let voteAverage = movie.voteAverage {
            cell.voteAverageLabel.text = String(format: "%.1f", voteAverage) + "/10"
        }
        
        if let genres = movie.genreIds {
            var genreString = String()
            
            _ = genres.flatMap{
                let currentGenre:Genre = DBManager.getByPrimaryKey(value: $0)
                if let genreName = currentGenre.name {
                    if genres.last == $0 {
                        genreString = genreString + genreName
                    } else {
                        genreString = genreString + genreName + ", "
                    }
                }
                
                return genreString
            }
            
            cell.genresLabel.text = genreString
            
        }
        
        return cell
    }
    
}
