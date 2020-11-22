//
//  RatingsStarsView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 17/11/2563 BE.
//

import UIKit

@IBDesignable
class RatingsStarsView: UIView {
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
        let nib = UINib(nibName: RatingsStarsView.NibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupUI()
    }
    
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var starsStackView: UIStackView!
    
    var ratingCount: Int = 0 {
        didSet {
            ratingCountLabel.text = "\(ratingCount) Ratings"
        }
    }
    
    private func setupUI() {
        starsStackView.removeAllArrangedSubviews()
        (1...5).reversed().forEach {
            starsStackView.addArrangedSubview(RatingsStarsItemView(starIndex: $0, starPercent: .random(in: 0...100)))
        }
    }
}
