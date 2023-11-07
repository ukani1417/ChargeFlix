//
//  TVShowPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

class TVShowPresenter: TVShowViewToPresenterProtocol {
    
    var router: TVShowPresenterToRouterProtocol?
    var interactor: TVShowPresenterToInteractorProtocol?
    var view:TVShowPresenterToViewProtocol?
    
    private(set) var tvShowsList: CommonListModel?
    private(set) var error: TVShowPresenterError?
    private(set) var tvshowDetail: DetailModel?
    
    init(router: TVShowPresenterToRouterProtocol? = nil,
         interactor: TVShowPresenterToInteractorProtocol? = nil,
         view: TVShowPresenterToViewProtocol? = nil) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
        view?.showActivity()
        interactor?.getTVShows(type: .popularTVShows, page: 1)
    }
}

extension TVShowPresenter: TVShowInteractorToPresenterProtocol {
    func onFetchTVShows(type: DataType, responce: Result<CommonListModel, TVShowPresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            self.tvShowsList = data
            view?.onFetchPopularTVShowsListSuccess(list: data.results)
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchTVShowDetail(responce: Result<DetailModel, TVShowPresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            self.tvshowDetail = data
            router?.navigateToTVShowDetail(with: data)
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
            
        }
    }
}

extension TVShowPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        view?.showActivity()
        interactor?.getTVShowById(type: .tvShowDetail, id: id)
    }
}
