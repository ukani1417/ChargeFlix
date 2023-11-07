//
//  MovieProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 06/11/23.
//

import Foundation

// Presenter -> View
protocol MoviePresenterToViewProtocol: AnyObject {
    var presenter: MovieViewToPresenterProtocol? { get set }
    
    func showActity()
    func hideActivity()
    func onFetchSuccess(data: [ContentObject])
    func onFetchFailure(message: String)
    func setupTitle(title: String)
}

// Presenter -> Interactor
protocol MoviePresenterToInteractorProtocol: AnyObject {
    var presenter: MovieInteractorToPresenterProtocol? { get set }
    var repository: Repository { get set }
   
    func getMovies(type: DataType, page: Int)
    func getMovieDetail(type: DataType, id: Int)
}
// Presenter -> Router
protocol MoviePresenterToRouterProtocol {
    func navigateToMovieDetail(with movie: DetailModel)
}

// View -> Presenter
protocol MovieViewToPresenterProtocol: AnyObject {
    var view: MoviePresenterToViewProtocol? { get set }
    var router: MoviePresenterToRouterProtocol? { get set }
    var interactor: MoviePresenterToInteractorProtocol? { get set }
   
    func viewDidLoad()
    func configerMovies(type: String, data: [ContentObject])
}

// Interactor -> Presenter
protocol MovieInteractorToPresenterProtocol: AnyObject {
    
    func onFetchMovies(dataType: DataType, responce: Result<CommonListModel, MoviePresenterError>)
    func onFetchMovieDetail(responce: Result<DetailModel, MoviePresenterError>)
    func configerMovies(type: String, data: [ContentObject])
}
