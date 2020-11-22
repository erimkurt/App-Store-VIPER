//
//  RatingsStarsItemView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 17/11/2563 BE.
//

import UIKit

class RatingsStarsItemView: UIView {
    /// Setup
    var view: UIView!

    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }

    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: RatingsStarsItemView.NibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    init(starIndex: Int, starPercent: Double) {
        super.init(frame: .zero)
        xibSetup()
        self.starIndex = starIndex
        self.starPercent = starPercent
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var starsStackView: UIStackView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var starIndex: Int = 0
    var starPercent: Double = 0.0
    
    func setupUI() {
        progressView.progress = Float(starPercent / 100.0)
        
        starsStackView.removeAllArrangedSubviews()
        (0..<starIndex).forEach { i in
            let icon = UIImageView(image: UIImage(systemName: "star.fill"))
            icon.tintColor = UIColor.gray.withAlphaComponent(0.2)
            icon.contentMode = .scaleAspectFit
            icon.translatesAutoresizingMaskIntoConstraints = false
            starsStackView.addArrangedSubview(icon)
            
            NSLayoutConstraint.activate([
                icon.widthAnchor.constraint(equalToConstant: 8),
                icon.heightAnchor.constraint(equalToConstant: 8)
            ])
        }
    }
}
