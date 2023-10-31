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
    
    init(repository: MovieRepository? = MovieRepository()) {
        self.repository = repository
    }
    
    func getPopularMovies() {
        repository?.get(modelType: PopularMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchSuccess(movieType: .populer, data: data.toListObj())
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchFailure(movieType: .populer)
            }
        }
    }
    
    func getTopRatedMovies() {
        repository?.get(modelType: TopRatedMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchSuccess(movieType: .topRated, data: data.toListObj())
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchFailure(movieType: .topRated)
            }
        }
    }
    
    func getUpComingMovies() {
        repository?.get(modelType: UpcomingMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchSuccess(movieType: .upcoming, data: data.toListObj())
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchFailure(movieType: .upcoming)
            }
        }
    }
    
    func getNowPlayingMovies() {
        repository?.get(modelType: NowPlayingMoviesList.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onfetchSuccess(movieType: .nowPlaying, data: data.toListObj())
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchFailure(movieType: .nowPlaying)
            }
        }
    }
    
    func getMovieGenreList() {
        repository?.get(modelType: MovieGenreList.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchMovieGenreListSuccess(data: data)
            case .failure(let error):
                debugPrint(error.localizedDescription)
                self.presenter?.onFetchMovieGenreListFailure()
            }
        }
    }
    
}
