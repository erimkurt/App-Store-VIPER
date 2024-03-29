//
//  TopFreeListProtocols.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//  
//

import UIKit

protocol TopFreeListPresenterInterface {
    var view: TopFreeListViewInterface? { get set }
    var interactor: TopFreeListInteractorInterface? { get set }
    var router: TopFreeListRouterInterface? { get set }
    var applications: [Application]? { get set }
    var title: String? { get set }
    
    /// Interactor
    func fetchTopFreeList()
    
    /// Router
    func showApplicationDetail(id: String)
}

protocol TopFreeListViewInterface: AnyObject {
    var presenter: TopFreeListPresenterInterface? { get set }
    
    func updateUI()
    func showError(error: Error)
}

protocol TopFreeListRouterInterface {
    var viewController: UIViewController? { get set }
    static func createModule() -> UIViewController
    
    func presentApplicationDetail(id: String)
}

protocol TopFreeListInteractorInterface {
    var presenter: TopFreeListInteractorDelegate? { get set }
    
    func getTopFreeList()
}

protocol TopFreeListInteractorDelegate: AnyObject {
    func getTopFreeListSuccess(feed: Feed)
    func failed(error: Error)
}
