//
//  TopFreeListTableViewController.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

protocol TopFreeListTableViewControllerDelegate: class {
    func topFreeListTableViewController(didSelect application: Application?, sender: TopFreeListTableViewController)
}

class TopFreeListTableViewController: BaseTableViewController {
    var presenter: TopFreeListPresenterInterface?
    weak var delegate: TopFreeListTableViewControllerDelegate?

    // MARK: - UI
    override func setupUI() {
        tableView.register(UINib.init(nibName: TopFreeListTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: TopFreeListTableViewCell.CellIdentifier)
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }
}

extension TopFreeListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.topFreeListTableViewController(didSelect: presenter?.applications?[indexPath.row], sender: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.applications?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TopFreeListTableViewCell.CellIdentifier, for: indexPath) as! TopFreeListTableViewCell
        cell.indexPath = indexPath
        cell.application = presenter?.applications?[indexPath.row]
        return cell
    }
}
