//
//  Repository.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 20/10/23.
//

import Foundation

protocol Repository {
    associatedtype T
    func get(modelType: T.Type,
             page:Int,
             _completation: @escaping (Result<T,Error>)->Void)
    func getDetails(modelType: T.Type,
                    id:Int,
                    _completation: @escaping (Result<T,Error>)->Void)
}
