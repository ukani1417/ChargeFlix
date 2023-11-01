//
//  MovieProtocols.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

protocol MovieViewInterface: AnyObject {
    var presenter: MoviePresenterInterface? { get set }
    
    func showActity()
    func hideActivity()
    
    func onFetchPopularMovieListSuccess(data: [ListObj])
    func onFetchPopularMovieListFailure()
}

protocol MoviePresenterInterface: AnyObject {
    var view: MovieViewInterface? { get set }
    var router: MovieRouterInterface? { get set }
    var interactor: MovieInteractorInterface? { get set }
    
    func viewDidLoad()
    
    func onfetchSuccess(movieType: MovieType, data: [ListObj])
    func onFetchPopularMovieListFailure()
    func didSelect(indexPath: IndexPath)
}

protocol MovieInteractorInterface: AnyObject {
    var presenter: MoviePresenterInterface? { get set }
    var repository: MovieRepository? { get set }
    
    func getMoviesMovies(type: MovieType)
}

protocol MovieRouterInterface: AnyObject {
    
}
