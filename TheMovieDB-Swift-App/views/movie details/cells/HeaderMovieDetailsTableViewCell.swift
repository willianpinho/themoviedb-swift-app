//
//  HeaderMovieDetailsTableViewCell.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit

class HeaderMovieDetailsTableViewCell: UITableViewCell {
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
    
    static func loadData(cell: HeaderMovieDetailsTableViewCell, movie: Movie) -> HeaderMovieDetailsTableViewCell? {
        if let title = movie.title {
            cell.titleLabel.text = title
        }
        
        if let releaseDate = movie.releaseDate {
            cell.releaseDateLabel.text = FormatString.convertDateToString(date: releaseDate)
        }
        
        if let posterPath = movie.posterPath {
            if let urlString = Images.generateImageUrl(path: posterPath, 500) {
                let url = URL(string: urlString)
                cell.posterImage.kf.setImage(with: url)
            }
        }
        
        if let voteAverage = movie.voteAverage.value {
            cell.voteAverageLabel.text = String(format: "%.1f", voteAverage) + "/10"
        }
        
       cell.genresLabel.text = parseGenres(movie: movie, genres: Array(movie.genres))
        
        return cell
    }
    
    static func parseGenres(movie: Movie, genres: [Genre]) -> String?  {
        var genreString = String()
        
        _ = genres.flatMap {
            let currentGenre:Genre = DBManager.getByPrimaryKey(value: $0.id)
            if genres.last == $0 {
                genreString = genreString + currentGenre.name
            } else {
                genreString = genreString + currentGenre.name + ", "
            }
            
            return nil
        }
        
        return genreString
    }
    
}
