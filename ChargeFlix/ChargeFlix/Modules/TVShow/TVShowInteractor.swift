//
//  TVShowInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

protocol TVShowInteractorInterface: AnyObject {
    var presenter: TVShowPresenterInterface? { get set }
    var repository: TVShowRepository? { get set }
    
    func getTVShow(type: TVShowType)
    func getTVShowById(id: Int)
}

class TVShowInteractor: TVShowInteractorInterface {

    var presenter: TVShowPresenterInterface?
    var repository: TVShowRepository?
    
    init(repository: TVShowRepository? = TVShowRepository()) {
        self.repository = repository
    }
    
    func getTVShow(type: TVShowType) {
        repository?.get(type: type) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchSuccess(tvShowType: type, data: data.toListObj())
            case .failure:
                self.presenter?.onFetchPopularTVShowsListFailure()
            }
        }
    }
    
    func getTVShowById(id: Int) {
        repository?.getDetails(id: id, completation: { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchByIdSuccess(data: data)
            case .failure:
                self.presenter?.onFetchByIdFailure()
            }
        })
    }
}
