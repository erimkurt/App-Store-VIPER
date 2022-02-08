//
//  ApplicationDetailRouter.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//  
//

import UIKit

class ApplicationDetailRouter: ApplicationDetailRouterInterface {
    weak var viewController: UIViewController?

    static func createModule(_ applicationID: String) -> UIViewController {
        let viewController = UIStoryboard.loadViewController() as ApplicationDetailViewController
        var presenter: ApplicationDetailPresenterInterface & ApplicationDetailInteractorDelegate = ApplicationDetailPresenter()
        var interactor: ApplicationDetailInteractorInterface = ApplicationDetailInteractor()
        var router: ApplicationDetailRouterInterface = ApplicationDetailRouter()

        viewController.presenter =  presenter

        presenter.applicationID = applicationID
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter

        router.viewController = viewController
        return viewController
    }
}
