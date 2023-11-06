//
//  CommonRepository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 04/11/23.
//

import Foundation

enum CommonRepositoryError: String, Error {
    case serverError = "Server error , try again after some time"
}

class CommonRepository: Repository {
    
    func get<T: Codable>(endPoint: ApiEndPoints, 
                         modelType: T.Type,
                         completation: @escaping (Result<T, CommonRepositoryError>) -> Void ) {
        APIManager.shared.request(apiRouter: endPoint, 
                                  modelType: modelType) { responce in
            switch responce {
            case .success(let data):    completation(.success(data))
            case .failure:
                completation(.failure(.serverError))
            }
        }
    }

}
