//
//  ApplicationDetailTableViewController.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//

import UIKit

class ApplicationDetailTableViewController: BaseTableViewController {
    var presenter: ApplicationDetailPresenterInterface?

    private var isExpandedDescription: Bool = false
    private var expandedInformationRow: [Int] = []
    
    // MARK: - UI
    override func setupUI() {
        tableView.register(UINib.init(nibName: ApplicationDetailHeaderTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailHeaderTableViewCell.CellIdentifier)
        tableView.register(UINib.init(nibName: ApplicationDetailPreviewInformationTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailPreviewInformationTableViewCell.CellIdentifier)
        tableView.register(UINib.init(nibName: ApplicationDetailPreviewTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailPreviewTableViewCell.CellIdentifier)
        tableView.register(UINib.init(nibName: ApplicationDetailDescriptionTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailDescriptionTableViewCell.CellIdentifier)
        tableView.register(UINib.init(nibName: ApplicationDetailRatingsTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailRatingsTableViewCell.CellIdentifier)
        tableView.register(UINib.init(nibName: ApplicationDetailReviewsTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailReviewsTableViewCell.CellIdentifier)
        tableView.register(UINib.init(nibName: ApplicationDetailInformationTableViewCell.NibName, bundle: nil), forCellReuseIdentifier: ApplicationDetailInformationTableViewCell.CellIdentifier)
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }
}

extension ApplicationDetailTableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let title = ApplicationDetailSections.init(rawValue: section)?.title {
            let header = ApplicationDetailHeaderView()
            header.title = title
            header.seeAllEnable = section == ApplicationDetailSections.ratings.rawValue
            return header
        }
        return nil
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (ApplicationDetailSections.init(rawValue: section)?.title) != nil {
            return 26
        }
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return ApplicationDetailSections.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == ApplicationDetailSections.information.rawValue,
           ApplicationDetailInformationRows.init(rawValue: indexPath.row)?.expandable ?? false,
           !expandedInformationRow.contains(indexPath.row) {
            expandedInformationRow.append(indexPath.row)
            tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: ApplicationDetailSections.information.rawValue)], with: .automatic)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == ApplicationDetailSections.information.rawValue {
            return ApplicationDetailInformationRows.count
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let application = presenter?.application
        
        switch indexPath.section {
        case ApplicationDetailSections.header.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailHeaderTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailHeaderTableViewCell
            cell.application = application
            return cell
        case ApplicationDetailSections.previewInformation.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailPreviewInformationTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailPreviewInformationTableViewCell
            cell.application = application
            return cell
        case ApplicationDetailSections.preview.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailPreviewTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailPreviewTableViewCell
            cell.urls = application?.screenshotUrls ?? []
            return cell
        case ApplicationDetailSections.description.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailDescriptionTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailDescriptionTableViewCell
            cell.descriptionString = application?.description ?? ""
            cell.isExpanded = isExpandedDescription
            cell.delegate = self
            return cell
        case ApplicationDetailSections.ratings.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailRatingsTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailRatingsTableViewCell
            cell.ratingCount = application?.userRatingCount ?? 0
            cell.averageRating = application?.averageUserRating ?? 0.0
            return cell
        case ApplicationDetailSections.reviews.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailReviewsTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailReviewsTableViewCell
            return cell
        case ApplicationDetailSections.information.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: ApplicationDetailInformationTableViewCell.CellIdentifier, for: indexPath) as! ApplicationDetailInformationTableViewCell
            let information = ApplicationDetailInformationRows.init(rawValue: indexPath.row)
            cell.title = information?.title ?? ""
            cell.detail = information?.detail(application: application) ?? ""
            cell.expandedDetail = information?.expandedDetail(application: application)
            cell.isExpanded = expandedInformationRow.contains(indexPath.row)
            return cell
        default: break
        }
        return UITableViewCell()
    }
}

extension ApplicationDetailTableViewController: ApplicationDetailDescriptionTableViewCellDelegate {
    func applicationDetailDescriptionTableViewCell(expanded sender: ApplicationDetailDescriptionTableViewCell) {
        isExpandedDescription = true
        tableView.reloadRows(at: [IndexPath(row: 0, section: ApplicationDetailSections.description.rawValue)], with: .automatic)
    }
}
