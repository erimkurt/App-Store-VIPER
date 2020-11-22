//
//  ApplicationDetailHeaderTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit
import AlamofireImage

class ApplicationDetailHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var getButton: GetButton!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var application: Application? {
        didSet {
            guard let application = application else { return }
            appImageView.af.setImage(withURL: URL(string: application.artworkUrl100 ?? "")!)
            nameLabel.text = application.trackName ?? "Name"
            artistNameLabel.text = application.artistName ?? "Artist Name"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
        appImageView.borderColor = UIColor.gray.withAlphaComponent(0.2)
        getButton.style = .blue
        shareButton.setImage(Image(systemName: "square.and.arrow.up"), for: .normal)
    }
}
