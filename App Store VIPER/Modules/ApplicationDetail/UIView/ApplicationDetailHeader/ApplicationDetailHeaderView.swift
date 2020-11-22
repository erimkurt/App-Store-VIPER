//
//  ApplicationDetailHeaderView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 17/11/2563 BE.
//

import UIKit

class ApplicationDetailHeaderView: UIView {
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
        let nib = UINib(nibName: ApplicationDetailHeaderView.NibName, bundle: bundle)
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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    
    public var seeAllEnable: Bool = false {
        didSet {
            seeAllButton.isHidden = !seeAllEnable
        }
    }
    public var title: String = "" {
        didSet {
            titleLabel.text = title
        }
    }
    
    private func setupUI() {
        seeAllEnable = false
    }
}
