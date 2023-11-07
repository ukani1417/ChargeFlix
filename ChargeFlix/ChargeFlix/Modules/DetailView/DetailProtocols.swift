//
//  DetailProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation

// Presenter -> View
protocol DetailPresenterToViewProtocol: AnyObject {
    var presenter: DetailViewToPresenterProtocol? { get set }
    
    func showActity()
    func hideActivity()
    func onFetchSuccess(data: CustomDetailViewModel)
    func onFetchFailure(message: String)
}

// Presenter -> Interactor
protocol DetailPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailInteractorToPresenterProtocol? { get set }
    var repository: Repository { get set }

    func getCastDetail(type:DataType, id: Int)
}
// Presenter -> Router
protocol DetailPresenterToRouterProtocol: AnyObject {
    func navigateToCastDetail(dataType: DataType, cast: Person)
}

// View -> Presenter
protocol DetailViewToPresenterProtocol: AnyObject {
    var view: DetailPresenterToViewProtocol? { get set }
    var router: DetailPresenterToRouterProtocol? { get set }
    var interactor: DetailPresenterToInteractorProtocol? { get set }
    var content: DetailModel { get set }
    
    func viewDidLoad()
    func configContent(type: DataType, content: DetailModel)
   
}

// Interactor -> Presenter
protocol DetailInteractorToPresenterProtocol: AnyObject {
    func onFetchCastDetail(responce:Result<Person,DetailPresenterError>)
}
