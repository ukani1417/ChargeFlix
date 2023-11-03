//
//  TVShowDetailPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

protocol TVShowDetailPresenterProtocol: AnyObject {
    var view: TVShowDetailViewControllerProtocol? { get set }
    var router:  TVShowDetailRouterProtocol? { get set }
    var interactor: TVShowDetailInteractorProtocol? { get set }
    var tvShow: TVShow { get set }
    
    func viewDidLoad()
    func onFetchTVShowVideoSuccess(data: MovieVideo)
    func onFetchTVShowVideoFailure()
    
    func onFetchTVShowCastSuccess(data: TVShowCast)
    func onFetchTVShowCastFailure()
    
    func onFetchCastDetailSuccess(data: Person)
    func onFetchCastDetailFailure()
}

class TVShowDetailPresenter: TVShowDetailPresenterProtocol {

    weak var view: TVShowDetailViewControllerProtocol?
    var router: TVShowDetailRouterProtocol?
    var interactor: TVShowDetailInteractorProtocol?
    var tvShow: TVShow
    
    init(view: TVShowDetailViewControllerProtocol? = nil, 
         router: TVShowDetailRouterProtocol? = nil,
         interactor: TVShowDetailInteractorProtocol? = nil, tvShow: TVShow) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.tvShow = tvShow
    }
    
    func viewDidLoad() {
        if let id = tvShow.id {
            interactor?.getTVShowCastsById(id: id)
            interactor?.getTVShowVideosById(id: id)
        }
        view?.onFetchSuccess(data: tvShow.toCustomDetailView())
    }
    
    func onFetchTVShowVideoSuccess(data: MovieVideo) {
        view?.onFetchVideoContent(data: data)
    }
    
    func onFetchTVShowVideoFailure() {
        
    }
    
    func onFetchTVShowCastSuccess(data: TVShowCast) {
        view?.onFetchCastContent(data: data.getListObj())
    }
    
    func onFetchTVShowCastFailure() {
        
    }
    
    func onFetchCastDetailSuccess(data: Person) {
        print("call back from interactor")
        router?.pushToCastDetail(type: .tvShow, cast: data)
    }
    
    func onFetchCastDetailFailure() {
        
    }
}

extension TVShowDetailPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        print("called in presenter")
        interactor?.getCastDetail(id: id)
    }
}
