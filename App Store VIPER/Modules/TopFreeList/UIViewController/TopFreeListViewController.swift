//
//  TopFreeListViewController.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//  
//

import UIKit
import Alamofire

class TopFreeListViewController: BaseViewController, StoryboardLoadable {
    var presenter: TopFreeListPresenterInterface?
    
    weak var tableViewController: TopFreeListTableViewController!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - UI
    override func setupUI() {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TopFreeListTableViewController {
            tableViewController = vc
            tableViewController.presenter = presenter
            tableViewController.delegate = self
        }
    }
    
    // MARK: - Network
    override func fetchData() {
        presenter?.fetchTopFreeList()
    }
}

extension TopFreeListViewController: TopFreeListViewInterface {
    func updateUI() {
        self.title = presenter?.title ?? ""
        tableViewController?.updateUI()
    }
    
    func showError(error: Error) {
        UIAlertController.showAlertMessage(with: error, viewController: self)
    }
}

extension TopFreeListViewController: TopFreeListTableViewControllerDelegate {
    func topFreeListTableViewController(didSelect application: Application?, sender: TopFreeListTableViewController) {
        presenter?.showApplicationDetail(id: application?.id ?? "0")
    }
}
