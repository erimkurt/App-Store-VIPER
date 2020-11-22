//
//  TopFreeListTableViewCell.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit
import AlamofireImage

class TopFreeListTableViewCell: UITableViewCell {

    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var getButton: GetButton!
    
    var indexPath: IndexPath = [] {
        didSet {
            indexLabel.text = "\(indexPath.row + 1)"
        }
    }
    var application: Application? {
        didSet {
            appImageView.af.setImage(withURL: URL(string: application?.artworkUrl100 ?? "")!)
            nameLabel.text = application?.name ?? "Name"
            genreLabel.text = application?.genreTitle ?? "Genre"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadView()
    }
    
    func loadView() {
        appImageView.borderColor = UIColor.gray.withAlphaComponent(0.2)
        getButton.style = .gray
    }
}
