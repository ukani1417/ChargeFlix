//
//  MovieRepository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

enum MovieRepositoryError: String, Error {
    case serverError = "Server error , try again after some time"
}

class MovieRepository {
    
    func get(type: MovieType,
             page: Int = 1,
             completation: @escaping (Result<MovieList, MovieRepositoryError>) -> Void) {
        var endPoint = MovieAPIEndPoints.populer(page: 1)
        switch type {
        case .populer:
            endPoint = .populer(page: page)
        case .topRated:
            endPoint = .topRated(page: page)
        case .upcoming:
            endPoint = .upComing(page: page)
        case .nowPlaying:
            endPoint = .nowPlaying(page: page)
        }
        
        APIManager.shared.request(apiRouter: endPoint, modelType: MovieList.self) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
    
    func getGenreList(completation: @escaping (Result<MovieGenreList, MovieRepositoryError>) -> Void) {
        APIManager.shared.request(apiRouter: MovieAPIEndPoints.genreList, modelType: MovieGenreList.self) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
    
    func getDetails(id: Int,
                    completation: @escaping (Result<Movie, MovieRepositoryError>) -> Void ) {
        APIManager.shared.request(apiRouter: MovieAPIEndPoints.movieDetails(id: id),
                                  modelType: Movie.self) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
}
