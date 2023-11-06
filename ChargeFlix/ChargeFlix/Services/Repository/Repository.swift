//
//  Repository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

protocol  Repository {
    func get<T: Codable>(endPoint: ApiEndPoints,
                         modelType: T.Type,
                         completation: @escaping (Result<T, CommonRepositoryError>) -> Void)
}
