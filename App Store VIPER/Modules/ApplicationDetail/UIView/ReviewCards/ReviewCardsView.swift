//
//  ReviewCardsView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 21/11/2563 BE.
//

import UIKit

class ReviewCardsView: UIView {
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
        let nib = UINib(nibName: ReviewCardsView.NibName, bundle: bundle)
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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static var height: CGFloat = 250.0
    
    private func setupUI() {
        collectionView.register(UINib.init(nibName: ReviewCardCollectionViewCell.NibName, bundle: nil), forCellWithReuseIdentifier: ReviewCardCollectionViewCell.CellIdentifier)
        
        collectionView.collectionViewLayout = ReviewCardsCollectionFlowLayout()
    }
}

extension ReviewCardsView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int.random(in: 5..<10)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewCardCollectionViewCell.CellIdentifier, for: indexPath) as! ReviewCardCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

class ReviewCardsCollectionFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        self.itemSize = CGSize(width: UIScreen.main.bounds.width, height: ReviewCardsView.height)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        scrollDirection = UICollectionView.ScrollDirection.horizontal
        minimumInteritemSpacing = 0
        minimumLineSpacing = 0
        sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
