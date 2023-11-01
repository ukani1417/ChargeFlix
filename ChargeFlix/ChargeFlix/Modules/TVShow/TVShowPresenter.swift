//
//  TVShowPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

enum TVShowType: CaseIterable {
    case populer
    case topRated
}

class TVShowPresenter: TVShowPresenterInterface {
    var router: TVShowRouterInterface?
    var interactor: TVShowInteractorInterface?
    var view: TVShowViewInterface?
    
    private var popularTVShowsList: [ListObj] = []
    
    init(router: TVShowRouterInterface? = nil, 
         interactor: TVShowInteractorInterface? = nil,
         view: TVShowViewInterface? = nil) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
        view?.showActivity()
        interactor?.getTVShow(type: .populer)
    }
    
    func onfetchSuccess(tvShowType: TVShowType, data: [ListObj]) {
        popularTVShowsList = data
        view?.hideActivity()
        view?.onFetchPopularTVShowsListSuccess(list: popularTVShowsList)
    }

    func onFetchPopularTVShowsListFailure() {
        view?.hideActivity()
        view?.onFetchPopularTVShowsListFailure()
    }
}
