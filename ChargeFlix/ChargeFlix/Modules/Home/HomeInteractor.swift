//
//  HomeInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

protocol HomeInteractorInterface {
    var presenter: HomePresenterInterface? { get set }
    var movieRepository: MovieRepository? { get set }
    var tvShowRepositoy: TVShowRepository? { get set }
    
    func getMovies(type: MovieType)
//    func getTVShows(type: TVShowType)
    func getMovieGenreList()
    func getMovieById(id: Int)
}

class HomeInteractor: HomeInteractorInterface {
    var movieRepository: MovieRepository?
    var tvShowRepositoy: TVShowRepository?
    weak var presenter: HomePresenterInterface?
    
    init(movieRepository: MovieRepository? = MovieRepository(),
         tvShowRepositoy: TVShowRepository? = TVShowRepository()) {
        self.movieRepository = movieRepository
        self.tvShowRepositoy = tvShowRepositoy
    }
    
    func getMovies(type: MovieType) {
        movieRepository?.get(type: type) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchMovieSuccess(movieType: type, data: data.toListObj())
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchMovieFailure(movieType: type)
            }
        }
    }
    
    func getMovieGenreList() {
        movieRepository?.getGenreList { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchMovieGenreListSuccess(data: data)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchMovieGenreListFailure()
            }
        }
    }
    
    func getMovieById(id: Int) {
        movieRepository?.getDetails(id: id ) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchMovieByIdSuccess(data: data)
            case .failure(let error):
                debugPrint(error)
                self.presenter?.onfetchMovieBYIdFailure()
            }
        }
    }
    
//    func getTVShows(type: TVShowType) {
//        tvShowRepositoy?.get(type: type) { result in
//            switch result {
//            case .success(let data):
//                self.presenter?.onfetchTVShowSuccess(tvShowType: type, data: data.toListObj())
//            case .failure:
//                self.presenter?.onFetchTVShowFailure(tvShowType: type)
//            }
//        }
//    }
}
