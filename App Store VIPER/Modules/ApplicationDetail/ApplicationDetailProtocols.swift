//
//  ApplicationDetailProtocols.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//  
//

import UIKit

protocol ApplicationDetailPresenterInterface {
    var view: ApplicationDetailViewInterface? { get set }
    var interactor: ApplicationDetailInteractorInterface? { get set }
    var router: ApplicationDetailRouterInterface? { get set }
    var applicationID: String { get set }
    var application: Application? { get set }
    
    /// Interactor
    func fetchApplication()
}

protocol ApplicationDetailViewInterface: AnyObject {
    var presenter: ApplicationDetailPresenterInterface? { get set }
    
    func updateUI()
    func showError(error: Error)
}

protocol ApplicationDetailRouterInterface {
    var viewController: UIViewController? { get set }
    static func createModule(_ applicationID: String) -> UIViewController
}

protocol ApplicationDetailInteractorInterface {
    var presenter: ApplicationDetailInteractorDelegate? { get set }
    
    func getApplication(form: GetApplicationForm)
}

protocol ApplicationDetailInteractorDelegate: AnyObject {
    func getApplicationSuccess(lookUp: LookUp)
    func failed(error: Error)
}
