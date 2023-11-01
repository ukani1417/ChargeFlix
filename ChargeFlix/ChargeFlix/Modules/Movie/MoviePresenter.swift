//
//  MoviePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation
import UIKit

class MoviePresenter: MoviePresenterInterface {
   
    weak var view: MovieViewInterface?
    
    var router: MovieRouterInterface?
    
    var interactor: MovieInteractorInterface?
    
    private var populerMovieList: [ListObj] = []
    
    init(view: MovieViewInterface? = nil, 
         router: MovieRouterInterface? = nil,
         interactor: MovieInteractorInterface? = nil) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.showActity()
        interactor?.getMoviesMovies(type: .populer)
    }
    
    func onfetchSuccess(movieType: MovieType, data: [ListObj]) {
        populerMovieList = data
        view?.hideActivity()
        view?.onFetchPopularMovieListSuccess(data: populerMovieList)
    }
        
    func onFetchPopularMovieListFailure() {
        view?.hideActivity()
        view?.onFetchPopularMovieListFailure()
    }
        
    func didSelect(indexPath: IndexPath) {
        print("tapped index : \(indexPath.row)")
    }
}

extension MoviePresenter: HomeToMovieProtocol {
    func setupMovieModule(title: String, data: [ListObj]) {
        view?.onFetchPopularMovieListSuccess(data: data)
    }
}
