//
//  TaglineMovieDetailsTableViewCell.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit
import Kingfisher

class TaglineMovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var taglineLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func loadData(cell: TaglineMovieDetailsTableViewCell, movie: Movie) -> TaglineMovieDetailsTableViewCell? {
        if let tagline = movie.tagLine {
            cell.taglineLabel.text = "\(tagline)"
        }
        
        return cell
    }
    
}
