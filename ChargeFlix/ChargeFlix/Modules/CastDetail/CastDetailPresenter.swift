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
    
}
