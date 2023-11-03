//
//  MovieDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

protocol MovieDetailInteractorProtocol {
    var presenter: MovieDetailPresenterProtocol? { get set }
    var movieRepo: MovieRepository? { get set }
    var castRepo: CastRepository? { get set }
    
    func getMovieVideosById(id: Int)
    func getMovieCastByMovieId(id: Int)
    func getCastDetail(id: Int) 
}

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    
    weak var presenter: MovieDetailPresenterProtocol?
    var movieRepo: MovieRepository?
    var castRepo: CastRepository?
    var movie: Movie?
    
    init(presenter: MovieDetailPresenter? = nil, 
         repository: MovieRepository = MovieRepository(),
         castRepository: CastRepository = CastRepository()) {
        self.presenter = presenter
        self.movieRepo = repository
        self.castRepo = castRepository
    }
    
    func getMovieVideosById(id: Int) {
        movieRepo?.getVideo(id: id) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchMovieVideoSuccess(data: data)
            case .failure:
                self.presenter?.onFetchMovieVideoFailure()
            }
        }
    }

    func getMovieCastByMovieId(id: Int) {
        
        castRepo?.getDetails(modelType: MovieCast.self, id: id, completation: { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastSuccess(data: data)
            case .failure:
                self.presenter?.onFetchMovieCastFailure()
            }
        })
    }
    
    func getCastDetail(id: Int) {
        castRepo?.getDetails(modelType: Person.self, id: id, completation: { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastDetailSuccess(data: data)
            case .failure:
                self.presenter?.onFetchCastDetailFailure()
               
            }
        })
    }
    
}
