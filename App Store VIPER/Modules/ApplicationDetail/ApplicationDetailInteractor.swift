//
//  ApplicationDetailInteractor.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 15/11/2563 BE.
//  
//

import Foundation

class ApplicationDetailInteractor: ApplicationDetailInteractorInterface {
    weak var presenter: ApplicationDetailInteractorDelegate?
    
    func getApplication(form: GetApplicationForm) {
        ServiceLocator.shared.appService.getApplication(form, completion: { [weak self] response in
            switch response.result {
            case let .success(lookUp):
                self?.presenter?.getApplicationSuccess(lookUp: lookUp)
            case let .failure(error):
                self?.presenter?.failed(error: error)
            }
        })
    }
}
