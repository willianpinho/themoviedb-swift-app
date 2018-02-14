//
//  VideosMovieDetailsTableViewCell.swift
//  TheMovieDB-Swift-App
//
//  Created by Willian Pinho on 14/02/18.
//  Copyright © 2018 Willian Pinho. All rights reserved.
//

import UIKit

class VideosMovieDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var video: Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    static func loadData(cell: VideosMovieDetailsTableViewCell, video: Video) -> VideosMovieDetailsTableViewCell? {
        
        
        if let urlString = Video.generateVideoUrl(video.key, video.site) {
            let url = URL(string: urlString)
            cell.thumbImageView.kf.setImage(with: url)
        }
        
        
        cell.titleLabel.text = video.name
        
        return cell
    }
    
}
