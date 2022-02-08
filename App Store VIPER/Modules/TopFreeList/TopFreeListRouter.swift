//
//  TopFreeListRouter.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//  
//

import UIKit

class TopFreeListRouter: TopFreeListRouterInterface {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let viewController = UIStoryboard.loadViewController() as TopFreeListViewController
        var presenter: TopFreeListPresenterInterface & TopFreeListInteractorDelegate = TopFreeListPresenter()
        var interactor: TopFreeListInteractorInterface = TopFreeListInteractor()
        var router: TopFreeListRouterInterface = TopFreeListRouter()

        viewController.presenter =  presenter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        router.viewController = viewController
        return viewController
    }
    
    func presentApplicationDetail(id: String) {
        let appDetail = ApplicationDetailRouter.createModule(id)
        viewController?.navigationController?.pushViewController(appDetail, animated: true)
    }
}
