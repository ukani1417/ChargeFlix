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
    func onFetchFailure(message: String)
}

// Presenter -> Interactor
protocol CastDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: CastDetailInteractorToPresenterProtocol? { get set }
    var repository: Repository { get set }
    
    func getCastCreditContentDetail(type:DataType, id: Int)

}
// Presenter -> Router
protocol CastDetailPresenterToRouterProtocol: AnyObject {
    func navigateToDetailView(content: DetailModel, type: DataType)
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
   
    func onFetchCastCreditContentDetail(type: DataType, responce: Result<DetailModel, CastPresenterError>)
}
