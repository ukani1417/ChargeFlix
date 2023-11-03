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

protocol TVShowPresenterInterface: AnyObject {
    var view: TVShowViewInterface? { get set }
    var router: TVShowRouterInterface? { get set }
    var interactor: TVShowInteractorInterface? { get set }
    
    func viewDidLoad()
    func onfetchSuccess(tvShowType: TVShowType, data: [ListObj])
    func onFetchPopularTVShowsListFailure()
    func onFetchByIdSuccess(data: TVShow)
    func onFetchByIdFailure()
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
    
    func onFetchByIdSuccess(data: TVShow) {
        view?.hideActivity()
        router?.pushToTVShowDetail(with: data)
    }
    
    func onFetchByIdFailure() {
        view?.hideActivity()
    }
    
}

extension TVShowPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        view?.showActivity()
        interactor?.getTVShowById(id: id)
    }
}
