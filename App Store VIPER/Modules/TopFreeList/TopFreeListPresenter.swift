//
//  TopFreeListPresenter.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//  
//

import Foundation

class TopFreeListPresenter: TopFreeListPresenterInterface {
    weak var view: TopFreeListViewInterface?
    var interactor: TopFreeListInteractorInterface?
    var router: TopFreeListRouterInterface?
    var applications: [Application]?
    var title: String?
    
    /// Interactor
    func fetchTopFreeList() {
        interactor?.getTopFreeList()
    }
    
    /// Router
    func showApplicationDetail(id: String) {
        router?.presentApplicationDetail(id: id)
    }
}

extension TopFreeListPresenter: TopFreeListInteractorDelegate {
    func getTopFreeListSuccess(feed: Feed) {
        DispatchQueue.main.async { [weak self] in
            self?.title = feed.title
            self?.applications = feed.results
            self?.view?.updateUI()
        }
    }
    
    func failed(error: Error) {
        DispatchQueue.main.async { [weak self] in
            self?.view?.showError(error: error)
        }
    }
}
