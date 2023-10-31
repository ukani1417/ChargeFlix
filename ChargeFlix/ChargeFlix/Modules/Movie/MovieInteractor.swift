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
    var popularMovieList: PopularMoviesList?
    
    init(presenter: MoviePresenterInterface? = nil, 
         repository: MovieRepository? = MovieRepository(),
         popularMovieList: PopularMoviesList? = nil) {
        
        self.presenter = presenter
        self.repository = repository
        self.popularMovieList = popularMovieList
    }
    
    func getPopularMovies() {
        repository?.get(modelType: PopularMoviesList.self, completation: { result in
            switch result {
            case .success(let data):
                self.popularMovieList = data
                self.presenter?.onFetchPopularMovieListSuccess()
            case .failure:
                self.presenter?.onFetchPopularMovieListFailure()
            }
        })
    }
}
