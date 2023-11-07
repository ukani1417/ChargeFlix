//
//  TVShowProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation

// Presenter -> View
protocol TVShowPresenterToViewProtocol: AnyObject {
    var presenter: TVShowViewToPresenterProtocol? { get set }
    
    func showActivity()
    func hideActivity()
    func onFetchPopularTVShowsListSuccess(list: [ContentObject])
    func onFetchFailure(message: String)
}

// Presenter -> Interactor
protocol TVShowPresenterToInteractorProtocol: AnyObject {
    var presenter: TVShowInteractorToPresenterProtocol? { get set }
    var repository: Repository { get set }

    func getTVShows(type: DataType, page: Int)
    func getTVShowById(type: DataType, id: Int)
}
// Presenter -> Router
protocol TVShowPresenterToRouterProtocol: AnyObject {
    func navigateToTVShowDetail(with tvShow: DetailModel)
}

// View -> Presenter
protocol TVShowViewToPresenterProtocol: AnyObject {
    var view: TVShowPresenterToViewProtocol? { get set }
    var router: TVShowPresenterToRouterProtocol? { get set }
    var interactor: TVShowPresenterToInteractorProtocol? { get set }
   
    func viewDidLoad()
}

// Interactor -> Presenter
protocol TVShowInteractorToPresenterProtocol: AnyObject {
       
    func onFetchTVShows(type: DataType, responce: Result<CommonListModel, TVShowPresenterError>)
    func onFetchTVShowDetail(responce: Result<DetailModel, TVShowPresenterError>)
    
}
