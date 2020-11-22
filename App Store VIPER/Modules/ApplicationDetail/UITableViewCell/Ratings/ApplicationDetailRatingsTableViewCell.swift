//
//  ApplicationDetailRatingsTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class ApplicationDetailRatingsTableViewCell: UITableViewCell {
    
    var ratingCount: Int = 0 {
        didSet {
            ratingsStarsView.ratingCount = ratingCount
        }
    }
    var averageRating: Double = 0.0 {
        didSet {
            rateLabel.text = String(format: "%.1f", averageRating)
        }
    }
    
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var ratingsStarsView: RatingsStarsView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
