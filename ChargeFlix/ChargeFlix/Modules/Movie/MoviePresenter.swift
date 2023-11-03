//
//  MoviePresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import UIKit

protocol MoviePresenterInterface: AnyObject {
    var view: MovieViewInterface? { get set }
    var router: MovieRouterInterface? { get set }
    var interactor: MovieInteractorInterface? { get set }
    
    func viewDidLoad()
    
    func onfetchSuccess(movieType: MovieType, data: [ListObj])
    func onFetchPopularMovieListFailure()
    func didSelect(indexPath: IndexPath)
    func configerMovies(type: String, data: [ListObj])
    
    func onfetchMovieByIdSuccess(data: Movie)
    func onfetchMovieBYIdFailure()
}

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
    
    func configerMovies(type: String, data: [ListObj]) {
        view?.setupTitle(title: type)
        view?.onFetchPopularMovieListSuccess(data: data)
    }
    
    func onfetchMovieByIdSuccess(data: Movie) {
        view?.hideActivity()
        router?.pushToMovieDetail(with: data)
    }
    
    func onfetchMovieBYIdFailure() {
        view?.hideActivity()
    }
}

// for didselect from CustomCollectionView
extension MoviePresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        if id != -1 {
            view?.showActity()
            interactor?.getMovieById(id: id)
        }
    }
}
