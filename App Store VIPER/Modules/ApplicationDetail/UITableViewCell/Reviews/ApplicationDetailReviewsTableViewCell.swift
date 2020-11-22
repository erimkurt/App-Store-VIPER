//
//  ApplicationDetailReviewsTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class ApplicationDetailReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var writeReviewButton: UIButton!
    @IBOutlet weak var appSupportButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
        let configuration = UIImage.SymbolConfiguration(scale: .small)
        writeReviewButton.setImage(UIImage(systemName: "square.and.pencil", withConfiguration: configuration),
                                   for: .normal)
        appSupportButton.setImage(UIImage(systemName: "questionmark.circle", withConfiguration: configuration),
                                   for: .normal)
    }
}
