//
//  ReviewStarsButtonGroupView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 17/11/2563 BE.
//

import UIKit

class ReviewStarsButtonGroupView: UIView {
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
        let nib = UINib(nibName: ReviewStarsButtonGroupView.NibName, bundle: bundle)
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
    
    @IBOutlet weak var buttonsStackView: UIStackView!
    
    var selectedStar: Int = 0 {
        didSet {
            buttons.forEach { button in
                let configuration = UIImage.SymbolConfiguration(weight: .light)
                let image = UIImage(systemName: (self.selectedStar >= button.tag) ? "star.fill" : "star", withConfiguration: configuration)
                button.setBackgroundImage(image, for: .normal)
            }
        }
    }
    var buttons: [UIButton] = []
    
    private func setupUI() {
        buttons = []
        buttonsStackView.removeAllArrangedSubviews()
        (1..<6).forEach { i in
            let button = UIButton()
            button.tag = i
            button.addTarget(self, action: #selector(starButtonPressed), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
               
            buttonsStackView.addArrangedSubview(button)
            buttons.append(button)
            
            NSLayoutConstraint.activate([
                button.widthAnchor.constraint(equalToConstant: 26),
                button.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
        selectedStar = 0
    }
    
    // MARK: - Actions
    @objc func starButtonPressed(_ sender: Any) {
        let tag = (sender as? UIButton)?.tag ?? 0
        selectedStar = tag
    }
}
