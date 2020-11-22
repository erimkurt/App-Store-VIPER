//
//  BaseTableViewController.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupUI()
    }
    
    // MARK: - UI
    func setupUI() {
        
    }
    
    // MARK: - Network
    func fetchData() {
        
    }
}
