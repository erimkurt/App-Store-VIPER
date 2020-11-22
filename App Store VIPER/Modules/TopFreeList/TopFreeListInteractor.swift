//
//  TopFreeListInteractor.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//  
//

import Foundation

class TopFreeListInteractor: TopFreeListInteractorInterface {
    weak var presenter: TopFreeListInteractorDelegate?
    
    func getTopFreeList() {
        ServiceLocator.shared.appService.getTopFree(completion: { [weak self] response in
            switch response.result {
            case let .success(feed):
                self?.presenter?.getTopFreeListSuccess(feed: feed.feed)
            case let .failure(error):
                self?.presenter?.failed(error: error)
            }
        })
    }
}
