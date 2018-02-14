//
//  InformationsMovieDetailTableViewCell.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit

class InformationsMovieDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func loadData(cell: InformationsMovieDetailTableViewCell, title: String, value: String) -> InformationsMovieDetailTableViewCell? {
        
        cell.titleLabel.text = title
        cell.valueLabel.text = value
        
        return cell
    }
    
}
