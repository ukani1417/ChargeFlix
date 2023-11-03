//
//  MovieDetailPresenter.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

protocol MovieDetailPresenterProtocol: AnyObject {
    var view: MovieDetailViewControllerProtocol? { get set }
    var interactor: MovieDetailInteractorProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set}
    var movie: Movie { get set }
    
    func viewDidLoad()
    
    func onFetchMovieVideoSuccess(data: MovieVideo)
    func onFetchMovieVideoFailure()
    
    func onFetchCastSuccess(data: MovieCast)
    func onFetchMovieCastFailure()
    
    func onFetchCastDetailSuccess(data: Person)
    func onFetchCastDetailFailure()
}

class MovieDetailPresenter: MovieDetailPresenterProtocol {
   
    weak var view: MovieDetailViewControllerProtocol?
    var interactor: MovieDetailInteractorProtocol?
    var router: MovieDetailRouterProtocol?
    var movie: Movie
    
    init(view: MovieDetailViewControllerProtocol? = nil, 
         interactor: MovieDetailInteractorProtocol? = nil,
         router: MovieDetailRouterProtocol? = nil, movie: Movie) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.movie = movie
    }
    
    func viewDidLoad() {
        
        if let id = movie.id {
            interactor?.getMovieVideosById(id: id)
            interactor?.getMovieCastByMovieId(id: id)
        }
       
        view?.onFetchSuccess(data: movie.toCustomDetailView())
    }
    
    func onFetchMovieVideoSuccess(data: MovieVideo) {
        view?.onFetchVideoContent(data: data)
    }
    
    func onFetchMovieVideoFailure() {
        
    }
    
    func onFetchCastSuccess(data: MovieCast) {
        view?.onFetchCastContennt(data: data.getListObj())
    }
    
    func onFetchMovieCastFailure() {
        
    }
    
    func onFetchCastDetailSuccess(data: Person) {
        router?.pushToCastDetail(type: .movie, cast: data)
    }
    
    func onFetchCastDetailFailure() {
        
    }
}

extension MovieDetailPresenter: CollectionViewToPresenter {
    func didSelectItemAt(id: Int) {
        interactor?.getCastDetail(id: id)
    }
}
