//
//  OverviewMovieDetailsTableViewCell.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit

class OverviewMovieDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func loadData(cell: OverviewMovieDetailsTableViewCell, movie: Movie) -> OverviewMovieDetailsTableViewCell? {
        if let overview = movie.overview {
            cell.overviewLabel.text = overview
        }

        return cell
    }
    
}
