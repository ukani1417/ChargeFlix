//
//  HomeInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 25/10/23.
//

import Foundation

class HomeInteractor: HomeInteractorInterface {
    var repository: MovieRepository?
    weak var presenter: HomePresenterInterface?
    
    var popularMovieList: PopularMoviesList?
    var topRateMovieList: TopRatedMoviesList?
    var upComingMovieList: UpcomingMoviesList?
    var nowPlayingMovieList: NowPlayingMoviesList?
    
    init(repository: MovieRepository? = MovieRepository()) {
        self.repository = repository
    }
    
    func getPopularMovies() {
        repository?.get(modelType: PopularMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.popularMovieList = data
                self.presenter?.onFetchPopularMovieListSuccess()
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchPopularMovieListFailure()
            }
        }
    }
    
    func getTopRatedMovies() {
        repository?.get(modelType: TopRatedMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.topRateMovieList = data
                self.presenter?.onFetchTopRatedMovieListSuccess()
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchTopRatedMovieListFailure()
            }
        }
    }
    
    func getUpComingMovies() {
        repository?.get(modelType: UpcomingMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.upComingMovieList = data
                self.presenter?.onFetchUpComingMovieListSuccess()
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchUpComingMovieListFailure()
            }
        }
    }
    
    func getNowPlayingMovies() {
        repository?.get(modelType: NowPlayingMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.nowPlayingMovieList = data
                self.presenter?.onFetchNowPlayingMovieListSuccess()
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchNowPlayingMovieListFailure()
            }
        }
    }
    
}
