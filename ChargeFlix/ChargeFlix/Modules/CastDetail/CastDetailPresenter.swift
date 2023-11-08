//
//  CastDetailPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

class CastDetailPresenter: CastDetailViewToPresenterProtocol {

    weak var view: CastDetailPresenterToViewProtocol?
    var router: CastDetailPresenterToRouterProtocol?
    var interactor: CastDetailPresenterToInteractorProtocol?
    var castType: DataType
    var cast: Person
    
    private(set) var creditContentDetail: DetailModel?
    private(set) var error: CastPresenterError?
    
    init(view: CastDetailPresenterToViewProtocol? = nil, 
         router: CastDetailPresenterToRouterProtocol? = nil,
         interactor: CastDetailPresenterToInteractorProtocol? = nil,
         castType: DataType, cast: Person) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.castType = castType
        self.cast = cast
    }
    
    func viewDidLoad() {
        view?.configCastData(type: castType, data: cast)
    }
    
    func configCastDetailContent(castType: DataType, cast: Person) {
        self.castType = castType
        self.cast = cast
        view?.configCastData(type: castType, data: cast)
    }
}

extension CastDetailPresenter: CastDetailInteractorToPresenterProtocol {
    func onFetchCastCreditContentDetail(type: DataType, responce: Result<DetailModel, CastPresenterError>) {
        switch responce {
        case .success(let data):
            self.creditContentDetail = data
            let detailType: DataType = (castType == .castMovieCredit) ? .movieDetail : .tvShowDetail
            router?.navigateToDetailView(content: data, type: detailType)
        case .failure(let error):
            self.error = error
            self.view?.onFetchFailure(message: error.rawValue)
        }
    }
}

extension CastDetailPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        if id != -1 {
            let contentType: DataType = (castType == .castMovieCredit) ? .movieDetail : .tvShowDetail
            interactor?.getCastCreditContentDetail(type: contentType, id: id)
        }
    }
}
