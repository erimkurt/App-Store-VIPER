//
//  ApplicationDetailPreviewInformationTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class ApplicationDetailPreviewInformationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var stackView: UIStackView!
    
    var application: Application? {
        didSet {
            stackView.removeAllArrangedSubviews()
            insertInfo(title: "\((application?.userRatingCount ?? 0).formatUsingAbbrevation()) ratings",
                       detail: String(format: "%.1f", application?.averageUserRating ?? 0.0),
                       rate: application?.averageUserRating ?? 0.0)
            
            insertInfo(title: "age",
                       detail: application?.trackContentRating ?? "",
                       subtitle: "Years Old")
            
            insertInfo(title: "chart",
                       detail: "ɴᴏ1",
                       subtitle: application?.genrePreview)
            
            insertInfo(title: "developer",
                       image: UIImage(systemName: "person.crop.square"),
                       subtitle: application?.artistName ?? "")
            
            insertInfo(title: "language",
                       detail: application?.languageCodesISO2A?.first ?? "",
                       subtitle: application?.languageCount)
            
            insertInfo(title: "size",
                       detail: application?.fileSizeBytes?.sizeOfFile,
                       subtitle: application?.fileSizeBytes?.sizeOfFileUnit)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
        lineView.backgroundColor = UIColor.genreGray?.withAlphaComponent(0.2)
    }
    
    private func insertInfo(title: String, detail: String? = nil, image: UIImage? = nil, subtitle: String? = nil, rate: Double? = nil) {
        let view = PreviewInfoView(title: title, detail: detail, image: image, subtitle: subtitle, rate: rate)
        stackView.addArrangedSubview(view)
    }
}
