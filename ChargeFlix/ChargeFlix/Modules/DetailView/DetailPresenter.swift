//
//  DetailPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 05/11/23.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var router:  DetailRouterProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var content: DetailModel { get set }
    
    func viewDidLoad()
    func onFetchCastDetail(responce:Result<Person,DetailPresenterError>)
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?
    var content: DetailModel
    var contentDataType: DataType
    
    init(view: DetailViewProtocol? = nil, 
         router: DetailRouterProtocol? = nil,
         interactor: DetailInteractorProtocol? = nil,
         content: DetailModel,
         contentDataType: DataType) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.content = content
        self.contentDataType = contentDataType
    }
    
    func viewDidLoad() {
        view?.onFetchSuccess(data: content.toCustomDetailView(type: contentDataType))
    }

    func onFetchCastDetail(responce: Result<Person, DetailPresenterError>) {
        switch responce {
        case .success(let data):
            router?.pushToCastDetail(dataType: contentDataType, cast: data)
        case .failure(let error):
            view?.onFetchFailure(message: error.rawValue)
        }
    }
}

extension DetailPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        interactor?.getCastDetail(id: id)
    }
}
