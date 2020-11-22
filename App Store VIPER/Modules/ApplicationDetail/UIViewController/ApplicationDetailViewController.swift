//
//  ApplicationDetailViewController.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//  
//

import UIKit

class ApplicationDetailViewController: BaseViewController, StoryboardLoadable {
    var presenter: ApplicationDetailPresenterInterface?
    
    weak var tableViewController: ApplicationDetailTableViewController!
    
    // MARK: - UI
    override func setupUI() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ApplicationDetailTableViewController {
            tableViewController = vc
            tableViewController.presenter = presenter
        }
    }
    
    // MARK: - Network
    override func fetchData() {
        presenter?.fetchApplication()
    }
}

extension ApplicationDetailViewController: ApplicationDetailViewInterface {
    func updateUI() {
        tableViewController?.updateUI()
    }
    
    func showError(error: Error) {
        UIAlertController.showAlertMessage(with: error, viewController: self)
    }
}
