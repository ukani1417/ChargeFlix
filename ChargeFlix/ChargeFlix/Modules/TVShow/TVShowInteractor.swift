//
//  TVShowInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class TVShowInteractor: TVShowInteractorInterface {

    var presenter: TVShowPresenterInterface?
    var repository: TVShowRepository?
    var popularTVShowsList: PopularTVShowsList?
    
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
}
