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
    
    func getPopulerTVShows() {
        repository?.get(modelType: PopularTVShowsList.self, _completation: { result in
            switch result {
            case .success(let data):
                self.popularTVShowsList = data
                self.presenter?.onFetchPopularTVShowsListSuccess()
            case .failure:
                self.presenter?.onFetchPopularTVShowsListFailure()
            }
        })
    }
}
