//
//  ApplicationDetailDescriptionTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

protocol ApplicationDetailDescriptionTableViewCellDelegate: AnyObject {
    func applicationDetailDescriptionTableViewCell(expanded sender: ApplicationDetailDescriptionTableViewCell)
}

class ApplicationDetailDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    var descriptionString: String = "" {
        didSet {
            descriptionLabel.text = descriptionString
        }
    }
    var isExpanded: Bool = false {
        didSet {
            descriptionLabel.numberOfLines = isExpanded ? 0 : 3
            moreButton.isHidden = isExpanded
        }
    }
    weak var delegate: ApplicationDetailDescriptionTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
        moreButton.layer.shadowColor = UIColor.systemBackground.cgColor
        moreButton.layer.shadowOpacity = 5
        moreButton.layer.shadowOffset = CGSize(width: -20, height: 0)
        moreButton.layer.shadowRadius = 5
    }

    // MARK: - Actions
    @IBAction func moreButtonPressed(_ sender: Any) {
        delegate?.applicationDetailDescriptionTableViewCell(expanded: self)
    }
}
