//
//  MovieRepository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

enum MovieRepositoryError: String, Error  {
    case serverError = "Server error , try again after some time"
}

class MovieRepository {
    
    func get<T:Codable>(modelType:T.Type,
                        page: Int = 1,
                        _completation: @escaping (Result<T,MovieRepositoryError>)->Void){
        
        var apiEndPoint: MovieAPIEndPoints? {
            switch modelType {
            case is PopularMoviesList.Type: return .populer(page: page)
            case is TopRatedMoviesList.Type: return .topRated(page: page)
            case is UpcomingMoviesList.Type: return .upComing(page: page)
            case is NowPlayingMoviesList.Type: return .nowPlaying(page: page)
            default : return  nil
            }
        }
        
        guard let apiEnd = apiEndPoint else {
            return _completation(.failure(.serverError))
        }
        
        APIManager.shared.request(apiRouter: apiEnd, modelType:modelType) { result in
            switch result {
            case .success(let data) :
                _completation(.success(data))
            case .failure(let error) :
                debugPrint(error)
                _completation(.failure(.serverError))
            }
        }
    }
   
    func getDetails<T:Codable>(modelType:T.Type,
                    id: Int ,
                    _completation: @escaping (Result<T,MovieRepositoryError>)->Void){
        
        APIManager.shared.request(apiRouter: MovieAPIEndPoints.movieDetails(id: id),                                       modelType: modelType) {
            result in
            switch result {
            case .success(let data) :
                _completation(.success(data))
            case .failure(let error) :
                debugPrint(error)
                _completation(.failure(.serverError))
            }
        }
    }
    
}
