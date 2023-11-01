//
//  MovieInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class MovieInteractor: MovieInteractorInterface {
    
    weak var presenter: MoviePresenterInterface?
    var repository: MovieRepository?
    
    init(presenter: MoviePresenterInterface? = nil, 
         repository: MovieRepository? = MovieRepository()) {
        
        self.presenter = presenter
        self.repository = repository
    }
    
    func getMoviesMovies(type: MovieType) {
        repository?.get(type: type) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchSuccess(movieType: .populer, data: data.toListObj())
            case .failure:
                self.presenter?.onFetchPopularMovieListFailure()
            }
        }
    }
}
