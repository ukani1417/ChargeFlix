//
//  TVShowRepository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

enum TVShowRepositoryError: String, Error {
    case serverError = "Server error , try again after some time"
}

class TVShowRepository {
    
    func get<T: Codable>(modelType: T.Type,
                         page: Int = 1,
                         _completation: @escaping (Result<T, TVShowRepositoryError>) -> Void ) {
        
        var apiEndPoint: TVShowAPIEndPoints? {
            switch modelType {
            case is PopularTVShows.Type: return .populer(page: page)
            case is TopRatedTVShows.Type: return .topRated(page: page)
            default: return  nil
            }
        }
        
        guard let apiEnd = apiEndPoint else {
            return _completation(.failure(.serverError))
        }
        
        APIManager.shared.request(apiRouter: apiEnd, modelType: modelType) { result in
            switch result {
            case .success(let data):
                _completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                _completation(.failure(.serverError))
            }
        }
    }
       
    func getDetails<T: Codable>(modelType: T.Type,
                                id: Int,
                                _completation: @escaping (Result<T, TVShowRepositoryError>) -> Void ) {
        
        APIManager.shared.request(apiRouter: TVShowAPIEndPoints.tVShowDetails(id: id),
                                  modelType: modelType) { result in
            switch result {
            case .success(let data):
                _completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                _completation(.failure(.serverError))
            }
        }
    }
}
