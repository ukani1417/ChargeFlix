//
//  CastDetailPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 03/11/23.
//

import UIKit

protocol CastDetailPresenterProtocol: AnyObject {
    
    var view: CastDetailViewControllerProtocol? { get set}
    var router: CastDetailRouterProtocol? { get set }
    var interactor: CastDetailInteractorProtocol? { get set }
    var castType: CastType? { get set }
    var cast: Person? { get set }
    func viewDidLoad()
    
    func onFetchCastImagesSuccess(data: [ListObj])
    func onFetchCastCredit(data: [ListObj])
    
    func onFetchCastImagesFailure()
    func onFetchCastCreditFailure()
}

class CastDetailPresenter: CastDetailPresenterProtocol {

    weak var view: CastDetailViewControllerProtocol?
    var router: CastDetailRouterProtocol?
    var interactor: CastDetailInteractorProtocol?
    var castType: CastType?
    var cast: Person?
    
    init(view: CastDetailViewControllerProtocol? = nil, 
         router: CastDetailRouterProtocol? = nil,
         interactor: CastDetailInteractorProtocol? = nil,
         castType: CastType? = nil,
         cast: Person? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.castType = castType
        self.cast = cast
    }
    
    func viewDidLoad() {
        if let id = cast?.id, let type = castType, let cast = self.cast {
            interactor?.getCastImagesById(id: id)
            interactor?.getCastCreditById(type: type, id: id)
            view?.configCastData(data: cast)
        }
       
    }
    
    func onFetchCastImagesSuccess(data: [ListObj]) {
        view?.configImageContent(data: data)
    }
    
    func onFetchCastCredit(data: [ListObj]) {
        view?.configCreditContent(data: data)
    }
    
    func onFetchCastImagesFailure() {
        
    }
    
    func onFetchCastCreditFailure() {
        
    }
}
