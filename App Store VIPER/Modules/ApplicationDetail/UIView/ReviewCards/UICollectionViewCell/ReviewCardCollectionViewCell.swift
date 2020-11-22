//
//  ReviewCardCollectionViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 21/11/2563 BE.
//

import UIKit

class ReviewCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var starsStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }

    private func loadView() {
        let rate: Int = .random(in: 1...5)
        starsStackView.removeAllArrangedSubviews()
        (1...5).forEach { i in
            let icon = UIImageView(image: UIImage(systemName: (rate >= i) ? "star.fill" : "star"))
            icon.tintColor = .orange
            icon.contentMode = .scaleAspectFit
            icon.translatesAutoresizingMaskIntoConstraints = false
            starsStackView.addArrangedSubview(icon)
            
            NSLayoutConstraint.activate([
                icon.widthAnchor.constraint(equalToConstant: 17),
                icon.heightAnchor.constraint(equalToConstant: 17)
            ])
            starsStackView.addArrangedSubview(icon)
        }
    }
}
