//
//  ApplicationDetailPreviewTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class ApplicationDetailPreviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var stackView: UIStackView!
    
    var urls: [String] = [] {
        didSet {
            stackView.removeAllArrangedSubviews()
            urls.forEach { image in
                insertImage(image)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
    }
    
    private func insertImage(_ image: String) {
        let imageView = UIImageView()
        imageView.cornerRadius = 20
        imageView.borderWidth = 1
        imageView.borderColor = UIColor.gray.withAlphaComponent(0.2)
        imageView.af.setImage(withURL: URL(string: image)!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2 + 100)
        ])
    }
}
