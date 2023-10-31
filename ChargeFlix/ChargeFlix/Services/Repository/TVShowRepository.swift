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
                         completation: @escaping (Result<T, TVShowRepositoryError>) -> Void ) {
        
        var apiEndPoint: TVShowAPIEndPoints? {
            switch modelType {
            case is PopularTVShowsList.Type: return .populer(page: page)
            case is TopRatedTVShowsList.Type: return .topRated(page: page)
            default: return  nil
            }
        }
        
        guard let apiEnd = apiEndPoint else {
            return completation(.failure(.serverError))
        }
        
        APIManager.shared.request(apiRouter: apiEnd, modelType: modelType) { result in
            switch result {
            case .success(let data):
                completation(.success(data))
            case .failure(let error):
                debugPrint(error)
                completation(.failure(.serverError))
            }
        }
    }
       
    func getDetails<T: Codable>(modelType: T.Type,
                                id: Int,
                                completation: @escaping (Result<T, TVShowRepositoryError>) -> Void ) {
        
        APIManager.shared.request(apiRouter: TVShowAPIEndPoints.tVShowDetails(id: id),
                                  modelType: modelType) { result in
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
