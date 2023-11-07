//
//  CastDetailProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation

// Presenter -> View
protocol CastDetailPresenterToViewProtocol: AnyObject {
    var presenter: CastDetailViewToPresenterProtocol? { get set }
    
    func showActity()
    func hideActivity()
    func configCastData(type: DataType, data: Person)
}

// Presenter -> Interactor
protocol CastDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: CastDetailInteractorToPresenterProtocol? { get set }
    var repository: Repository { get set }

}
// Presenter -> Router
protocol CastDetailPresenterToRouterProtocol: AnyObject {
    
}

// View -> Presenter
protocol CastDetailViewToPresenterProtocol: AnyObject {
    var view: CastDetailPresenterToViewProtocol? { get set }
    var router: CastDetailPresenterToRouterProtocol? { get set }
    var interactor: CastDetailPresenterToInteractorProtocol? { get set }
    var castType: DataType { get set }
    var cast: Person { get set }
    
    func viewDidLoad()
    func configCastDetailContent(castType: DataType, cast: Person)
   
}

// Interactor -> Presenter
protocol CastDetailInteractorToPresenterProtocol: AnyObject {
   
}
