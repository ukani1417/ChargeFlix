//
//  DetailPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 05/11/23.
//

import Foundation

class DetailPresenter: DetailViewToPresenterProtocol {
    weak var view: DetailPresenterToViewProtocol?
    var router: DetailPresenterToRouterProtocol?
    var interactor: DetailPresenterToInteractorProtocol?
    var content: DetailModel
    var contentDataType: DataType
    
    private(set) var castDetail: Person?
    private(set) var error: DetailPresenterError?
    
    init(view: DetailPresenterToViewProtocol? = nil, 
         router: DetailPresenterToRouterProtocol? = nil,
         interactor: DetailPresenterToInteractorProtocol? = nil,
         content: DetailModel, contentDataType: DataType) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.content = content
        self.contentDataType = contentDataType
    }
    
    func viewDidLoad() {
        view?.onFetchSuccess(data: content.toCustomDetailView(type: contentDataType))
    }
    
    func configContent(type: DataType, content: DetailModel) {
        self.content = content
        self.contentDataType = type
        view?.onFetchSuccess(data: content.toCustomDetailView(type: contentDataType))
    }
    
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    func onFetchCastDetail(responce: Result<Person, DetailPresenterError>) {
        view?.hideActivity()
        switch responce {
        case .success(let data):
            self.castDetail = data
            let creditType: DataType = (contentDataType == .movieDetail) ? .castMovieCredit : .castTVShowCredit
            router?.navigateToCastDetail(dataType: creditType,
                                         cast: data)
        case .failure(let error):
            self.error = error
            view?.onFetchFailure(message: error.rawValue)
        }
    }
}

extension DetailPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        view?.showActity()
        interactor?.getCastDetail(type: .castDetail, id: id)
    }
}
