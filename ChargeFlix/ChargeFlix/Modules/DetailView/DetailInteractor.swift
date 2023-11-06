//
//  MovieDetailInteractor.swift
//  ChargeFlix
//
//  Created by Dhruv Ukani on 02/11/23.
//

import Foundation

protocol DetailInteractorProtocol {
    var presenter: DetailPresenterProtocol? { get set }
    var repository: Repository { get set }

    func getCastDetail(type:DataType, id: Int)
}

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
    var repository: Repository
    
    init(repository: Repository = CommonRepository()) {
        self.repository = repository
    }
    
    func getCastDetail(type: DataType, id: Int) {
        repository.get(endPoint: type.fromDataTypeToEndPoint(id),
                        modelType: Person.self) { result in
            switch result {
            case .success(let data):
                self.presenter?.onFetchCastDetail(responce: .success(data))
            case .failure:
                self.presenter?.onFetchCastDetail(responce: .failure(.failedInCastDetail))
            }
        }
    }
    
}
