//
//  ApplicationDetailPresenter.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//  
//

import Foundation

class ApplicationDetailPresenter: ApplicationDetailPresenterInterface {
    weak var view: ApplicationDetailViewInterface?
    var interactor: ApplicationDetailInteractorInterface?
    var router: ApplicationDetailRouterInterface?
    var applicationID: String = "0"
    var application: Application?
    
    /// Interactor
    func fetchApplication() {
        let form = GetApplicationForm(id: applicationID)
        interactor?.getApplication(form: form)
    }
}

extension ApplicationDetailPresenter: ApplicationDetailInteractorDelegate {
    func getApplicationSuccess(lookUp: LookUp) {
        DispatchQueue.main.async { [weak self] in
            self?.application = lookUp.results.first
            self?.view?.updateUI()
        }
    }
    
    func failed(error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.showError(error: error)
        }
    }
}
