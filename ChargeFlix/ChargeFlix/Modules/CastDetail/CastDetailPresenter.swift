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
    var castType: DataType { get set }
    var cast: Person { get set }
    func viewDidLoad()
}

class CastDetailPresenter: CastDetailPresenterProtocol {

    weak var view: CastDetailViewControllerProtocol?
    var router: CastDetailRouterProtocol?
    var interactor: CastDetailInteractorProtocol?
    var castType: DataType
    var cast: Person
    
    init(view: CastDetailViewControllerProtocol? = nil, 
         router: CastDetailRouterProtocol? = nil,
         interactor: CastDetailInteractorProtocol? = nil,
         castType: DataType,
         cast: Person) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.castType = castType
        self.cast = cast
    }
    
    func viewDidLoad() {
        view?.configCastData(type: castType, data: cast)
    }
}
