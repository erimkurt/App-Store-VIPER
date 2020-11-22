//
//  ApplicationDetailInformationTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class ApplicationDetailInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var expandedDetailLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    var detail: String = "" {
        didSet {
            detailLabel.text = detail
        }
    }
    
    var expandedDetail: String? {
        didSet {
            expandedDetailLabel.text = expandedDetail
            arrowImageView.isHidden = (expandedDetail == nil)
        }
    }
    
    var isExpanded: Bool = false {
        didSet {
            expandedDetailLabel.isHidden = !isExpanded
            if (expandedDetail != nil) {
                arrowImageView.isHidden = isExpanded
                detailLabel.isHidden = isExpanded
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let image = UIImage(systemName: "chevron.down", withConfiguration: configuration)
        arrowImageView.image = image
        isExpanded = false
    }
}
