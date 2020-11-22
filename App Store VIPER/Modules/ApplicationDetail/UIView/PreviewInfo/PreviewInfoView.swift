//
//  PreviewInfoView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class PreviewInfoView: UIView {
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
        let nib = UINib(nibName: PreviewInfoView.NibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    init(title: String, detail: String? = nil, image: UIImage? = nil, subtitle: String? = nil, rate: Double? = nil) {
        super.init(frame: .zero)
        xibSetup()
        self.title = title
        self.detail = detail
        self.image = image
        self.subtitle = subtitle
        self.rate = rate
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var starsStackView: UIStackView!
    
    var title: String = ""
    var detail: String?
    var image: UIImage?
    var subtitle: String?
    var rate: Double?
    
    private func setupUI() {
        detailLabel.isHidden = (detail == nil)
        subtitleLabel.isHidden = (subtitle == nil)
        imageView.isHidden = (image == nil)
        starsStackView.isHidden = (rate == nil)
        
        titleLabel.text = title.uppercased()
        detailLabel.text = detail ?? ""
        subtitleLabel.text = subtitle ?? ""
        imageView.image = image ?? UIImage()
        
        detailLabel.textColor = .gray
        
        starsStackView.removeAllArrangedSubviews()
        (1..<6).forEach { i in
            let icon = UIImageView(image: star(i))
            icon.tintColor = .gray
            icon.contentMode = .scaleAspectFit
            icon.preferredSymbolConfiguration = UIImage.SymbolConfiguration(scale: .small)
            icon.translatesAutoresizingMaskIntoConstraints = false
            starsStackView.addArrangedSubview(icon)
            
            NSLayoutConstraint.activate([
                icon.widthAnchor.constraint(equalToConstant: 11),
                icon.heightAnchor.constraint(equalToConstant: 15)
            ])
        }
    }
    
    private func star(_ number: Int) -> UIImage {
        let index = Double(number)
        let rating = round((rate ?? 0.0) / 0.5) * 0.5
        let name = (rating < index - 0.5) ? "star" : rating < index ? "star.lefthalf.fill" : "star.fill"
        return UIImage(systemName: name) ?? UIImage()
    }
}
