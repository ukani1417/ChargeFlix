//
//  TVShowPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol TVShowPresenterProtocol: AnyObject {
    var view: TVShowViewProtocol? { get set }
    var router: TVShowRouterProtocol? { get set }
    var interactor: TVShowInteractorProtocol? { get set }
    
    func viewDidLoad()
    func onFetchTVShows(type: DataType, responce: Result<CommonListModel, TVShowPresenterError>)
    func onFetchTVShowDetail(responce: Result<DetailModel, TVShowPresenterError>)
}

class TVShowPresenter: TVShowPresenterProtocol {
    
    var router: TVShowRouterProtocol?
    var interactor: TVShowInteractorProtocol?
    var view: TVShowViewProtocol?
    
    init(router: TVShowRouterProtocol? = nil, 
         interactor: TVShowInteractorProtocol? = nil,
         view: TVShowViewProtocol? = nil) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
        view?.showActivity()
        interactor?.getTVShows(type: .popularTVShows, page: 1)
    }
    
    func onFetchTVShows(type: DataType, responce: Result<CommonListModel, TVShowPresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            view?.onFetchPopularTVShowsListSuccess(list: data.results)
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
    
    func onFetchTVShowDetail(responce: Result<DetailModel, TVShowPresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            router?.navigateToTVShowDetail(with: data)
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
            
        }
    }
}

extension TVShowPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        view?.showActivity()
        interactor?.getTVShowById(id: id)
    }
}
